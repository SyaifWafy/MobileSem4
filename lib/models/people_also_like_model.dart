  class PeopleAlsoLikeModel{
    final String title;
    final String location;
    final int day;
    final String image;
    final int price;

    PeopleAlsoLikeModel({
      required this.title,
      required this.location,
      required this.day,
      required this.image,
      required this.price
    });
  }

  List<PeopleAlsoLikeModel> peopleAlsoLikeModel= [
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image: "assets/images/carnaval.jpg",
        day: 5, price: 430),
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image: "assets/images/carnaval.jpg",
        day: 7, price: 233),
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image: "assets/images/carnaval.jpg",
        day: 9, price: 550),
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image:"assets/images/carnaval.jpg",
        day: 3, price: 546),
  ];
