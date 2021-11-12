import 'package:saffrun_app/data_managment/base_networkservice.dart';

class AuthNetworkService extends BaseNetworkService {
  Future<bool> sendLoginDataToServer(String username, String password) async {
    try {
      Map<String, String> body = {"username": username, "password": password};
      print(body);
      dynamic jsonResponse = await postTemplate('/api/auth/login/', body);
      print(jsonResponse);
      if (jsonResponse == null) {
        return false;
      }
      print(jsonResponse);
      saveToken(jsonResponse['access']);
      setTokenToHeader();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> sendSignUpDataToServer(String username, String password) async {
    try {
      Map<String, String> body = {"username": username, "password": password};
      print(body);
      dynamic? jsonResponse = await postTemplate('/api/auth/register/', body);
      if (jsonResponse == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
