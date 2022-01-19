import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/data_managment/base_networkservice.dart';

class SettingNetworkService extends BaseNetworkService {
  Map<String, String> _headerFile = {};

  Future<bool> sendInfoToServer(Map<String, dynamic> userInfo) async {
    try {
      dynamic result = await putTemplate('/profile/user/', userInfo);
      if (result == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<http.MultipartRequest> initImageForSend(
      String uploadProfile, File file) async {
    var parseUri = Uri.parse(uploadProfile);
    var request = http.MultipartRequest("POST", parseUri);
    request.headers.addAll(_headerFile);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', file.path);
    request.files.add(multipartFile);
    return request;
  }

  Future<Map> uploadImage(File file) async {
    try {
      print(file.path);
      var _prefs = await SharedPreferences.getInstance();
      if (_prefs.containsKey('token')) {
        _headerFile['Authorization'] = 'Bearer ' + _prefs.getString('token')!;
      }
      print(_headerFile);
      String uploadProfile = urlServer + '/core/image/upload/';
      http.MultipartRequest request =
          await initImageForSend(uploadProfile, file);
      final response = await request.send();
      String result = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        return convert.jsonDecode(result);
      } else {
        throw ('Error');
      }
    } catch (error) {
      throw (error);
    }
  }
}
