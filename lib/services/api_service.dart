import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wisata_model.dart';
import '../models/event_model.dart';

class ApiService {
  final String baseUrl = "https://api.example.com";

  Future<List<Wisata>> fetchTempatWisata() async {
  try {
    final response = await http.get(Uri.parse('http://172.26.189.216/Mobile%20API/readwisata.php'));
    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse is List) {
        return jsonResponse.map((item) => Wisata.fromJson(item)).toList();
      } else if (jsonResponse is Map && jsonResponse.containsKey('data')) {
        final List<dynamic> data = jsonResponse['data'];
        return data.map((item) => Wisata.fromJson(item)).toList();
      } else {
        throw Exception('Unexpected response structure');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load data. Error: $e');
  }
}

  Future<List<Event>> fetchEvents(String wisataId) async {
    try {
      final response = await http.get(Uri.parse('http://172.26.189.216/Mobile%20API/readevent.php'));

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
