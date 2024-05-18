class Event {
  final String id;
  final String nama;
  final String lokasi;
  final String gambar;
  final String deskripsi;

  Event({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.gambar,
    required this.deskripsi,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      nama: json['nama'],
      lokasi: json['lokasi'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
    );
  }
}
