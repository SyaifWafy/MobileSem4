import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/api_service.dart';

class MasukanPage extends StatefulWidget {
  const MasukanPage({super.key});

  @override
  _MasukanPageState createState() => _MasukanPageState();
}

class _MasukanPageState extends State<MasukanPage> with SingleTickerProviderStateMixin {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _masukanController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _submitMasukan() async {
    String nama = _namaController.text;
    String masukan = _masukanController.text;

    if (nama.isEmpty || masukan.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nama dan Masukan harus diisi'),
        ),
      );
      return;
    }

    try {
      final response = await apiService.submitMasukan(nama, masukan);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Masukan berhasil dikirim'),
        ),
      );
      _namaController.clear();
      _masukanController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengirim masukan: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Masukan'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        leading: Container(), // Remove the back button
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.deepPurple[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Berikan Masukan Anda',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _masukanController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Masukan',
                    prefixIcon: Icon(Icons.feedback),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    alignLabelWithHint: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: _submitMasukan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent, // Warna latar belakang
                    padding: EdgeInsets.symmetric(vertical: 16.0), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Sudut membulat
                    ),
                    elevation: 10, // Shadow untuk tombol
                  ),
                  child: Text(
                    'Kirim',
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                      fontSize: 16.0, // Ukuran teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100], // Warna latar belakang
    );
  }
}
