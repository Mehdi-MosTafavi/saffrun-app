import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

Map<String, String> header = {
  'Accept': 'application/json',
  'Content-Type': 'application/json; charset=utf-8',
  'Client': 'app'
};

class BaseNetworkService {
  String urlServer = "http://10.0.2.2:8000/api";

  Future<void> saveToken(String token) async {
    var _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
  }

  Future<String?> setTokenToHeader() async {
    var _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('token')) {
      header['Authorization'] = 'Bearer ' + _prefs.getString('token')!;
      return _prefs.getString('token');
    }
  }

  Future<dynamic>? postTemplate(String url, var body) async {
    try {
      var _body = convert.json.encode(body);
      http.Response response = await http.post(Uri.parse(urlServer + url),
          headers: header, body: _body);
      print(response.statusCode);
      ;
      print(response.body);
      print(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        return _jsonResponse;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic>? getTemplate(String url, {Map<String, String>? body}) async {
    try {
      String urlOfBody = '?';
      if (body != null) {
        body.forEach((key, value) {
          urlOfBody = urlOfBody + key + '=' + value + '&';
        });
      }
      print(urlServer + url + urlOfBody);
      http.Response response = await http
          .get(Uri.parse(urlServer + url + urlOfBody), headers: header);
      print(response.body);
      if (response.statusCode == 200) {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        print(_jsonResponse);
        return _jsonResponse;
      }
    } catch (e) {
      rethrow;
    }
  }
}
