import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/constants/const.dart';

import '../../models/user/user_2.dart';

String getImageUrl() {
  if (DefaultImage == UserProfile.userLogin.image) return DefaultImage;
  return "http://10.0.2.2:8000" + UserProfile.userLogin.image;
}

String getImageUrlUsers(String url) {
  if (DefaultImage == url) return DefaultImage;
  return "http://10.0.2.2:8000" + url;
}

DateTime getTime(String time) {
  print(time);
  DateTime date = DateTime.parse(time);
  return date.toLocal();
}

String formatTimeString(DateTime dateTime) {
  Jalali date = Jalali.fromDateTime(dateTime);
  var f = date.formatter;
  return f.dd +
      ' ' +
      f.mN +
      ' ' +
      f.yyyy +
      ' | ' +
      dateTime.hour.toString() +
      ':' +
      dateTime.minute.toString();
}

String formatTimeReserveString(DateTime dateTime) {
  Jalali date = Jalali.fromDateTime(dateTime);
  var f = date.formatter;
  return dateTime.hour.toString() + ':' + dateTime.minute.toString();
}

String formatDateReserveString(DateTime dateTime) {
  Jalali date = Jalali.fromDateTime(dateTime);
  var f = date.formatter;
  return f.dd + ' ' + f.mN + ' ' + f.yyyy;
}

String getDateForCircle(DateTime dateTime) {
  Jalali date = Jalali.fromDateTime(dateTime);
  var f = date.formatter;
  return f.dd + ' ' + f.mN;
}
