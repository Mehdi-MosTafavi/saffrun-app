import 'package:flutter/material.dart';

class User {
  String Name;
  String LastName;
  String Phone;
  String Address;
  int Type;

  User(
      {
      required this.Name,
      required this.LastName,
      required this.Phone,
      required this.Address,
      this.Type = 0, cmText,
      }) ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["Name"] = this.Name;
    data["LastName"] = this.LastName;
    // data["Token"] = this.Token;
    data["Phone"] = this.Phone;
    data["Type"] = this.Type;
    return data;
  }

  static late User CurrentUser;

  //static User get CurrentUser => User._User;
  //static set CurrentUser(User _user) => User._User = _user;
  //User.SetUser(User _user){_User = _user;}
  static User test_user = User(
      Name: 'علی',
      LastName: 'باقرزاده',
      Phone: '09175510883',
      Address: 'بوشهر - خیابان امام خمینی',
      Type: 1);
  static User test_user2 = User(
      Name: 'کامبیز',
      LastName: 'دیرباز',
      Phone: '09175510883',
      Address: 'بوشهر - خیابان امام خمینی',
      Type: 1);
}
