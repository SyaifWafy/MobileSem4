import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/event.dart';
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
    // Memeriksa jika wisataId tidak null, lalu mengambil data
    if (widget.wisataId.isNotEmpty) {
      futureEvents = ApiService().fetchEvents(widget.wisataId);
    } else {
      // Jika wisataId null atau kosong, munculkan pesan error
      futureEvents = Future.error('Wisata ID is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: FutureBuilder<List<Event>>(
        future: futureEvents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return GridView.builder(
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
                    child: Column(
                      children: [
                        Image.network(
                          event.gambar,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Text(event.nama),
                          subtitle: Text(event.lokasi),
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