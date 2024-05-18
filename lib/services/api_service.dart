import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tempat_wisata.dart';
import '../models/event.dart';

class ApiService {
  final String baseUrl = "https://api.example.com";

  Future<List<TempatWisata>> fetchTempatWisata() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tempat-wisata'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => TempatWisata.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data. Error: $e');
    }
  }

  Future<List<Event>> fetchEvents(String wisataId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/wisata/$wisataId/events'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Event.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data. Error: $e');
    }
  }
}
