import 'package:saffrun_app/data_managment/base_networkservice.dart';

class SplashNetworkService extends BaseNetworkService {
  Future<bool> haveTokenFromServerValid() async {
    try {
      String? token = await setTokenToHeader();
      if (token == null) {
        return false;
      }
      Map<String, String> body = {"token": token};
      print(body);
      dynamic? jsonResponse = await postTemplate('/auth/verify/', body);
      if (jsonResponse == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  fetchProfile() async {
    try {
      String? token = await setTokenToHeader();
      if (token == null) {
        return false;
      }
      dynamic? jsonResponse = await getTemplate('/profile/user/');
      if (jsonResponse == null) {
        return null;
      }
      print(jsonResponse);
      return jsonResponse;
    } catch (e) {
      print(e);
      return false;
    }
  }

  sendNotifToken(String? subscribedToken) async {
    try {
      if (!header.containsKey('Authorization')) {
        return false;
      }
      Map<String, String> body = {"notification_token": subscribedToken ?? " "};
      print(body);
      dynamic? jsonResponse = await postTemplate(
          '/notification/set-user-notification-token/', body);
      if (jsonResponse == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
    }
  }
}