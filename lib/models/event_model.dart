class Event {
  final String kd_event;
  final String judul;
  final String tanggal;
  final String pukul;
  final String isi;
  final String tempat;
  final String gambarevent;
  final String kd_wisata;
  final String username_admin;

  Event({
    required this.kd_event,
    required this.judul,
    required this.tanggal,
    required this.pukul,
    required this.isi,
    required this.tempat,
    required this.gambarevent,
    required this.kd_wisata,
    required this.username_admin,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      kd_event: json['kd_event'],
      judul: json['judul'],
      tanggal: json['tanggal'],
      pukul: json['pukul'],
      isi: json['isi'],
      tempat: json['tempat'],
      gambarevent: json['gambarevent'],
      kd_wisata: json['kd_wisata'],
      username_admin: json['username_admin'],
    );
  }
}
