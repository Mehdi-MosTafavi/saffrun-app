import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class BaseNetworkService {
  String urlServer = "http://127.0.0.1:8000";
  Map<String, String> header = {
    "accept": "application/json",
    "Content-Type": "application/json"
  };

  Future<void> saveToken(String token) async {
    var _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
  }

  Future<String?> setTokenToHeader() async {
    var _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('token')) {
      header['Authorization'] = _prefs.getString('token')!;
      return _prefs.getString('token');
    }
  }

  Future<dynamic>? postTemplate(String url, var body) async {
    try {
      print('dsfsdfsd');
      var _body = convert.json.encode(body);
      print(urlServer + url);
      http.Response response = await http.post(Uri.parse(urlServer + url),
          headers: header, body: _body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        return _jsonResponse;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic>? getTemplate(String url) async {
    try {
      http.Response response =
          await http.get(Uri.parse(urlServer + url), headers: header);
      if (response.statusCode == 200) {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        if (_jsonResponse['meta']['status_code'] == 200) {
          return _jsonResponse;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
