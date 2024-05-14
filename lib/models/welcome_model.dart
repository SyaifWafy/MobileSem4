class WelcomeModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;

  WelcomeModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
}

List<WelcomeModel> welcomeComponents = [
  WelcomeModel(
      title: "JemberWonder",
      subTitle: "Wisata",
      description:
          "Temukan Wisata menarik di kabupaten jember",
      imageUrl: "assets/images/gambir.jpg"),
  WelcomeModel(
      title: "JemberWonder",
      subTitle: "Event",
      description:
          "Nikmati keseruan beragam event",
      imageUrl: "assets/images/carnaval.jpg"),
  WelcomeModel(
      title: "JermberWonder",
      subTitle: "Pengaduan",
      description:
          "Memberikan kenyamanan wisatawan",
      imageUrl: "assets/images/happy.jpg"),
];
