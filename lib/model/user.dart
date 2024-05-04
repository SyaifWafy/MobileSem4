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

  Map<String, dynamic> toJson() =>
  {
    'username': username_cus.toString(),
    'pw_cus': pw_cus,
    'fullname_cus': fullname_cus,
    'pertanyaan': pertanyaan,
    'jawaban': jawaban,
    
  };
}