import 'package:saffrun_app/data_managment/base_networkservice.dart';

class SplashNetworkService extends BaseNetworkService {
  Future<bool> haveTokenFromServerValid() async {
    try {
      String? token = await setTokenToHeader();

      if (token == null) {
        return false;
      }
      return true;
    }
    catch (e) {
      return false;
    }
  }

}