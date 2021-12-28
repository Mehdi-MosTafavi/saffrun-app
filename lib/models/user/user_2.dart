class UserProfile {
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  String country;
  String province;
  String address;
  int wallet;

  UserProfile(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.country,
      required this.province,
      this.wallet = 0,
      required this.address});

  static late UserProfile userLogin;

  static UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile(
        username: json['username'],
        firstName: json['first_name'] ?? "بدون نام",
        lastName: json['last_name'] ?? "بدون نام",
        email: json['email'] ?? " ",
        phone: json['phone'] ?? " ",
        country: json['country'] ?? " ",
        province: json['province'] ?? " ",
        address: json['address'] ?? " ");
  }

  String getFullName() {
    return firstName + ' ' + lastName;
  }
}
