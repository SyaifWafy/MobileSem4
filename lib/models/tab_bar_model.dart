class TabBarModel {
  final String title;
  final String location;
  final String image;
  final int price;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,
      required this.price});
}

List<TabBarModel> places = [
  TabBarModel(
      title: "Kebun Teh Gambir",
      location: "Gambir",
      image: "assets/images/alam1.jpg",
      price: 320),
  TabBarModel(
      title: "Taman Botani",
      location: "Sukorambi",
      image: "assets/images/alam2.jpg",
      price: 262),
  TabBarModel(
      title: "Taman Nasional Meru Betiri",
      location: "Betiri",
      image: "assets/images/alam3.jpg",
      price: 221),
  TabBarModel(
      title: "Pantai Papuma",
      location: "Desa Lolejer",
      image: "assets/images/laut1.jpg",
      price: 543),
  TabBarModel(
      title: "Pantai Papuma",
      location: "Desa Lolejer",
      image: "assets/images/laut1.jpg",
      price: 543),
  TabBarModel(
      title: "Pantai Cemara",
      location: "Puger",
      image: "assets/images/laut2.jpg",
      price: 238),
  TabBarModel(
      title: "Teluk Love",
      location: "Ambulu",
      image: "assets/images/laut3.jpg",
      price: 124),
  TabBarModel(
      title: "wana Wisata Simbat",
      location: "Wuluhan",
      image: "assets/images/lainya1.jpg",
      price: 756),
  TabBarModel(
      title: "Mumbul Garden",
      location: "Mumbul",
      image:
          "assets/images/lainya2.jpg",
      price: 321),
  TabBarModel(
      title: "Museum Huruf",
      location: "Semanggi",
      image: "assets/images/lainya3.jpg",
      price: 340),
];