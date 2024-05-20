import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/tempat_wisata.dart';
import 'detail_pages.dart';

class WisataPage extends StatefulWidget {
  const WisataPage({Key? key}) : super(key: key);

  @override
  _WisataPageState createState() => _WisataPageState();
}

class _WisataPageState extends State<WisataPage> {
  late Future<List<TempatWisata>> futureTempatWisata;

  @override
  void initState() {
    super.initState();
    futureTempatWisata = ApiService().fetchTempatWisata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata'),
      ),
      body: FutureBuilder<List<TempatWisata>>(
        future: futureTempatWisata,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var tempatWisata = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(tempatWisata: tempatWisata),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          tempatWisata.gambar,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Text(tempatWisata.nama),
                          subtitle: Text(tempatWisata.lokasi),
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
