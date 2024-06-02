import 'package:flutter/material.dart';
import '../models/wisata_model.dart';

class DetailPage extends StatelessWidget {
  final Wisata tempatWisata;

  DetailPage({required this.tempatWisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tempatWisata.nama_wisata),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              tempatWisata.gambarwisata,
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
                    tempatWisata.nama_wisata,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    tempatWisata.kategori,
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    tempatWisata.lokasi,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    tempatWisata.keterangan,
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
