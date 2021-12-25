import 'package:saffrun_app/data_managment/base_networkservice.dart';

import '../../main.dart';
import '../splash/splash_networkservice.dart';

class AuthNetworkService extends BaseNetworkService {
  Future<bool> sendLoginDataToServer(String username, String password) async {
    try {
      Map<String, String> body = {"username": username, "password": password};
      print(body);
      dynamic jsonResponse = await postTemplate('/auth/login/', body);
      print(jsonResponse);
      if (jsonResponse == null) {
        return false;
      }
      saveToken(jsonResponse['access']);
      setTokenToHeader();
      await SplashNetworkService()
          .sendNotifToken(await najva.getSubscribedToken());
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
      dynamic? jsonResponse = await postTemplate('/auth/register/', body);
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