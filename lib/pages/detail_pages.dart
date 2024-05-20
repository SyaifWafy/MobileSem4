import 'package:flutter/material.dart';
import '../models/tempat_wisata.dart';

class DetailPage extends StatelessWidget {
  final TempatWisata tempatWisata;

  DetailPage({required this.tempatWisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tempatWisata.nama),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              tempatWisata.gambar,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tempatWisata.nama,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    tempatWisata.lokasi,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    tempatWisata.deskripsi,
                    style: TextStyle(fontSize: 16),
                  ),
                  // Tambahkan bagian event terkait di sini jika ada
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
