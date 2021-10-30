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
      dynamic? jsonResponse = await postTemplate('/api/auth/verify/', body);
      if (jsonResponse == null) {
        return false;
      }
      return true;
    }
    catch (e) {
      return false;
    }
  }

}