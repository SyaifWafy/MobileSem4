import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    futureEvents = ApiService().fetchEvent();
  }

  Future<String> fetchImageUrl(String kdEvent) async {
    final response = await http.get(Uri.parse('http://172.26.189.216/ProjekMobileSem4/projekmobile_sem4/lib/API/get_imageevent.php?kd_event=$kdEvent'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['image_url'] is String) {
        print("Fetched image URL: ${jsonResponse['image_url']}");
        return jsonResponse['image_url'];
      } else {
        throw Exception('Invalid image URL');
      }
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
                            child: FutureBuilder<String>(
                              future: fetchImageUrl(event.kd_event.toString()),
                              builder: (context, imageSnapshot) {
                                if (imageSnapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (imageSnapshot.hasError) {
                                  return const Center(child: Icon(Icons.error));
                                } else if (imageSnapshot.hasData) {
                                  return Image.network(
                                    imageSnapshot.data!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(child: Icon(Icons.error));
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(child: CircularProgressIndicator());
                                    },
                                  );
                                } else {
                                  return const Center(child: Icon(Icons.error));
                                }
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            event.judul,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.deepPurpleAccent,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  event.tempat,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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
