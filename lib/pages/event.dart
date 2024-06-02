import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/event_model.dart';
import 'detail_event.dart';

class EventPage extends StatefulWidget {
  final String wisataId;

  const EventPage({Key? key, required this.wisataId}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late Future<List<Event>> futureEvents;

  @override
  void initState() {
    super.initState();
    if (widget.wisataId.isNotEmpty) {
      futureEvents = ApiService().fetchEvents(widget.wisataId);
    } else {
      futureEvents = Future.error('Wisata ID is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), // Remove the back button
        title: const Text('Events'),
      ),
      body: FutureBuilder<List<Event>>(
        future: futureEvents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var event = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailEventPage(event: event),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              event.gambarevent,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(child: Icon(Icons.error));
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(event.judul),
                          subtitle: Text(event.tempat),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
