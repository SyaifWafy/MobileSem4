import 'package:flutter/material.dart';
import '../nav_pages.dart/main_wrapper.dart';

class wisata extends StatelessWidget {
  const wisata({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wisata'),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // Tambahkan aksi di sini jika diperlukan
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Ini adalah halaman Wisata',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
  

  
  
  
  
