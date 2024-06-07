  class PeopleAlsoLikeModel{
    final String title;
    final String location;
    final int day;
    final String image;
    final int price;
    final String kategori;

    PeopleAlsoLikeModel({
      required this.title,
      required this.location,
      required this.day,
      required this.image,
      required this.price,
      required this.kategori
    });
  }

  List<PeopleAlsoLikeModel> peopleAlsoLikeModel= [
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image: "assets/images/carnaval.jpg",
        day: 5, price: 430, 
        kategori: "Festival"),
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image: "assets/images/carnaval.jpg",
        day: 7, price: 233,
        kategori: "Festival"),
    PeopleAlsoLikeModel(
        title: "Jember Fashion Carnaval",
        location: "Alun-Alun Jember",
        image: "assets/images/carnaval.jpg",
        day: 9, price: 550,
        kategori: "Festival"),
  ];
