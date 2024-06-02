class Wisata {
  final int kd_wisata;
  final String nama_wisata;
  final String keterangan;
  final String lokasi;
  final String gambarwisata;
  final String kategori;
  final String username_admin;

  Wisata({
    required this.kd_wisata,
    required this.nama_wisata,
    required this.keterangan,
    required this.lokasi, 
    required this.gambarwisata,
    required this.kategori,
    required this.username_admin,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
      kd_wisata: int.parse(json['kd_wisata']),
      nama_wisata: json['nama_wisata'],
      keterangan: json['keterangan'],
      lokasi: json['lokasi'],
      gambarwisata: json['gambarwisata'],
      kategori: json['kategori'],
      username_admin: json['username_admin'],
    );
  }
}
