import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../models/user/user_2.dart';

String getImageUrl() {
  return "http://10.0.2.2:8000" + UserProfile.userLogin.image;
}

String getImageUrlUsers(String url) {
  return "http://10.0.2.2:8000" + url;
}

DateTime getTime(String time) {
  return DateTime.parse(time);
}

String formatTimeString(DateTime dateTime) {
  Jalali date = Jalali.fromDateTime(dateTime);
  var f = date.formatter;
  return f.dd +
      ' ' +
      f.mN +
      ' ' +
      f.yy +
      ' | ' +
      dateTime.hour.toString() +
      ':' +
      dateTime.minute.toString();
}

String getDateForCircle(DateTime dateTime) {
  Jalali date = Jalali.fromDateTime(dateTime);
  var f = date.formatter;
  return f.dd + ' ' + f.mN;
}
