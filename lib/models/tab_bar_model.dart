class TabBarModel {
  final String title;
  final String location;
  final String image;
  final int price;
  final String kategori;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,
      required this.price,
      required this.kategori,});
}

List<TabBarModel> places = [
  TabBarModel(
      title: "Kebun Teh Gambir",
      kategori: "Bukit",
      location: "Gambir",
      image: "assets/images/alam1.jpg",
      price: 320),
  TabBarModel(
      title: "Taman Botani",
      kategori: "Bukit",
      location: "Sukorambi",
      image: "assets/images/alam2.jpg",
      price: 262),
  TabBarModel(
      title: "Taman Nasional Meru Betiri",
      kategori: "Taman",
      location: "Betiri",
      image: "assets/images/alam3.jpg",
      price: 221),
  TabBarModel(
      title: "Pantai Papuma",
      kategori: "Pantai",
      location: "Desa Lolejer",
      image: "assets/images/laut1.jpg",
      price: 543),
  TabBarModel(
      title: "Pantai Papuma",
      kategori: "Pantai",
      location: "Desa Lolejer",
      image: "assets/images/laut1.jpg",
      price: 543),
  TabBarModel(
      title: "Pantai Cemara",
      kategori: "Pantai",
      location: "Puger",
      image: "assets/images/laut2.jpg",
      price: 238),
  TabBarModel(
      title: "Teluk Love",
      kategori: "Pantai",
      location: "Ambulu",
      image: "assets/images/laut3.jpg",
      price: 124),
  TabBarModel(
      title: "wana Wisata Simbat",
      kategori: "Pantai",
      location: "Wuluhan",
      image: "assets/images/lainya1.jpg",
      price: 756),
  TabBarModel(
      title: "Mumbul Garden",
      kategori: "Pantai",
      location: "Mumbul",
      image:
          "assets/images/lainya2.jpg",
      price: 321),
  TabBarModel(
      title: "Museum Huruf",
      kategori: "Bangunan",
      location: "Semanggi",
      image: "assets/images/lainya3.jpg",
      price: 340),    
];