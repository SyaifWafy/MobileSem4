class TempatWisata {
  final int id;
  final String nama;
  final String deskripsi;
  final String lokasi;
  final String gambar;

  TempatWisata({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.lokasi,
    required this.gambar,
  });

  factory TempatWisata.fromJson(Map<String, dynamic> json) {
    return TempatWisata(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      lokasi: json['lokasi'],
      gambar: json['gambar'],
    );
  }
}
