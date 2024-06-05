class TabBarModel {
  final String title;
  final String location;
  final String image;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,});
}

List<TabBarModel> places = [
  TabBarModel(
      title: "Kebun Teh Gambir",
      location: "Gambir",
      image: "assets/images/alam1.jpg"),
  TabBarModel(
      title: "Taman Botani",
      location: "Sukorambi",
      image: "assets/images/alam2.jpg"),
  TabBarModel(
      title: "Taman Nasional Meru Betiri",
      location: "Betiri",
      image: "assets/images/alam3.jpg"),
  TabBarModel(
      title: "Pantai Papuma",
      location: "Desa Lolejer",
      image: "assets/images/laut1.jpg"),
  TabBarModel(
      title: "Pantai Papuma",
      location: "Desa Lolejer",
      image: "assets/images/laut1.jpg"),
  TabBarModel(
      title: "Pantai Cemara",
      location: "Puger",
      image: "assets/images/laut2.jpg"),
  TabBarModel(
      title: "Teluk Love",
      location: "Ambulu",
      image: "assets/images/laut3.jpg"), 
];