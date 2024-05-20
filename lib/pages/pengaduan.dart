import 'package:flutter/material.dart';
import 'package:http/http.dart';
class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});
  @override
  _PengaduanPageState createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> with SingleTickerProviderStateMixin {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _kontakController = TextEditingController();
  TextEditingController _pengaduanController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Masukan'),
        backgroundColor: Colors.deepPurpleAccent,
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
                  controller: _kontakController,
                  decoration: InputDecoration(
                    labelText: 'Kontak',
                    prefixIcon: Icon(Icons.phone),
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
                  controller: _pengaduanController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Pengaduan',
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
                  onPressed: () {
                    // Logika untuk mengirim pengaduan
                    String nama = _namaController.text;
                    String kontak = _kontakController.text;
                    String pengaduan = _pengaduanController.text;

                    // Di sini dapat ditambahkan logika untuk mengirim pengaduan
                    print('Nama: $nama, Kontak: $kontak, Pengaduan: $pengaduan');
                  },
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
