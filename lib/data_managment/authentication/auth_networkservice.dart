import 'package:saffrun_app/data_managment/base_networkservice.dart';

class AuthNetworkService extends BaseNetworkService {
  Future<bool> sendLoginDataToServer(String username, String password) async {
    try {
      Map<String, String> body = {"username": username, "password": password};
      print(body);
      String? jsonResponse = await postTemplate('/api/auth/login/', body);
      print(jsonResponse);
      if (jsonResponse == null) {
        return false;
      }
      print(jsonResponse);
      // saveToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> sendSignUpDataToServer(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
