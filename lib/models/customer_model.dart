class Customer {
  final String username_cus;
  final String pw_cus;
  final String fullname_cus;
  final String pertanyaan;
  final String jawaban;

  Customer({
    required this.username_cus,
    required this.pw_cus,
    required this.fullname_cus,
    required this.pertanyaan,
    required this.jawaban,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      username_cus: json['username_cus'],
      pw_cus: json['pw_cus'],
      fullname_cus: json['fullname_cus'],
      pertanyaan: json['pertanyaan'],
      jawaban: json['jawaban'],
    );
  }
}
