class User
{
  String username_cus;
  String pw_cus;
  String fullname_cus;
  String pertanyaan;
  String jawaban;

  User(
    this.username_cus,
    this.pw_cus,
    this.fullname_cus,
    this.pertanyaan,
    this.jawaban,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json["username_cus"]) as String,
    json["pw_cus"]
    json["fullname_cus"]
  );

  Map<String, dynamic> toJson() =>
  {
    'username_cus': username_cus.toString(),
    'pw_cus': pw_cus,
    'fullname_cus': fullname_cus,
    'pertanyaan': pertanyaan,
    'jawaban': jawaban,
    
  };
}