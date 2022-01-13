import 'package:saffrun_app/constants/const.dart';

class UserProfile {
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  String country;
  String province;
  String address;
  String image;
  String gender;
  double wallet;

  UserProfile(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.country,
      required this.province,
      required this.image,
      required this.gender,
      this.wallet = 120000,
      required this.address});

  static late UserProfile userLogin;

  static UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile(
        username: json['username'],
        firstName: json['first_name'] ?? "بدون نام",
        lastName: json['last_name'] ?? "بدون نام",
        email: json['email'] ?? " ",
        gender: getGender(json['gender']),
        phone: json['phone'] ?? " ",
        country: json['country'] ?? " ",
        province: json['province'] ?? " ",
        image: json['avatar']['image'] == null ||
                (json['avatar']['image']).length == 0
            ? DefaultImage
            : json['avatar']['image']['full_size'],
        address: json['address'] ?? " ");
  }

  String getFullName() {
    return firstName + ' ' + lastName;
  }

  static String getGender(json) {
    if (json == "N") return "";
    if (json == "M") return "male";
    return "female";
  }
}
