import 'package:saffrun_app/data_managment/splash/splash_networkservice.dart';
import 'package:saffrun_app/models/user/user_2.dart';

class SplashRepository {
  late SplashNetworkService splashNetworkService;

  SplashRepository() {
    splashNetworkService = SplashNetworkService();
  }

  Future<bool> haveTokenAndValid() async {
    try {
      bool status = await splashNetworkService.haveTokenFromServerValid();
      if (status) {
        dynamic result = await splashNetworkService.fetchProfile();
        if (result == null) {
          return false;
        }
        UserProfile.userLogin = UserProfile.fromJson(result);
      }
      return status;
    }
    catch (e) {
      rethrow;
    }
  }
}