import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/wisata_model.dart';
import 'detail_wisata.dart';

class WisataPage extends StatefulWidget {
  const WisataPage({Key? key}) : super(key: key);

  @override
  _WisataPageState createState() => _WisataPageState();
}

class _WisataPageState extends State<WisataPage> {
  late Future<List<Wisata>> futureWisata;
  late Future<List<Wisata>> futureImages;

  @override
  void initState() {
    super.initState();
    futureWisata = ApiService().fetchTempatWisata();
    futureImages = ApiService().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Wisata'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([futureWisata, futureImages]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            var tempatWisataList = snapshot.data![0] as List<Wisata>;
            var imageList = snapshot.data![1] as List<Wisata>;
            var imageMap = {
              for (var item in imageList) item.kd_wisata: item.gambarwisata
            };

            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: tempatWisataList.length,
              itemBuilder: (context, index) {
                var tempatWisata = tempatWisataList[index];
                var dataImage = imageMap[tempatWisata.kd_wisata];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(tempatWisata: tempatWisata),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: dataImage != null &&
                                          dataImage.isNotEmpty
                                      ? NetworkImage(
                                          'http://192.168.1.16/WebSem4/storage/app/public/img/' +
                                              dataImage)
                                      : const AssetImage(
                                              'assets/fallback_image.png')
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    print(
                                        'Error loading image: $exception\n$stackTrace');
                                    // Handle error loading image
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(tempatWisata.nama_wisata),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.deepPurpleAccent,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  tempatWisata.lokasi,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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
