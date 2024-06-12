import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wisata_model.dart';
import '../models/event_model.dart';

class ApiService {
  final String baseUrl = "http://192.168.100.9/MobileSem4/lib/API";

  Future<List<Wisata>> fetchTempatWisata() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/readwisata.php'));
      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);
        print(jsonResponse);
        if (jsonResponse is List) {
          return jsonResponse.map((item) => Wisata.fromJson(item)).toList();
        } else if (jsonResponse is Map && jsonResponse.containsKey('data')) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((item) => Wisata.fromJson(item)).toList();
        } else {
          throw Exception('Gagal memuat data. Format data tidak dikenali.');
        }
      } else {
        throw Exception('Gagal memuat data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal memuat data. Error: $e');
    }
  }

  Future<List<Event>> fetchEvent() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/readevent.php'));
      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);
        print(jsonResponse);
        if (jsonResponse is List) {
          return jsonResponse.map((item) => Event.fromJson(item)).toList();
        } else if (jsonResponse is Map && jsonResponse.containsKey('data')) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((item) => Event.fromJson(item)).toList();
        } else {
          throw Exception('Gagal memuat data. Format data tidak dikenali.');
        }
      } else {
        throw Exception('Gagal memuat data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal memuat data. Error: $e');
    }
  }

  Future<List<Wisata>> fetchImages() async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/readwisataimages.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((image) => Wisata.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  } catch (e) {
    throw Exception('Failed to load images. Error: $e');
  }
}

  Future<void> submitMasukan(String nama, String masukan) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/createmasukan.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nama': nama,
          'masukan': masukan,
        }),
      );
      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          print('Masukan berhasil dikirim');
        } else {
          throw Exception('Gagal mengirim masukan: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Gagal mengirim masukan. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal mengirim masukan. Error: $e');
}
}
}