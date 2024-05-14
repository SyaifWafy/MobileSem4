import 'package:flutter/material.dart';
import '../nav_pages.dart/main_wrapper.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});
  @override
  _PengaduanPageState createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _kontakController = TextEditingController();
  TextEditingController _pengaduanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengaduan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Judul Pengaduan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _kontakController,
              decoration: InputDecoration(
                labelText: 'Kontak',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _pengaduanController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Pengaduan',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Logika untuk mengirim pengaduan
                String nama = _namaController.text;
                String kontak = _kontakController.text;
                String pengaduan = _pengaduanController.text;

                // Di sini dapat ditambahkan logika untuk mengirim pengaduan
                print('Nama: $nama, Kontak: $kontak, Pengaduan: $pengaduan');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, // Warna latar belakang
              ),
              child: Text(
                'Kirim',
                style: TextStyle(
                  color: Colors.white, // Warna teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}