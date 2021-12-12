import 'package:saffrun_app/data_managment/splash/splash_networkservice.dart';

class SplashRepository {
  late SplashNetworkService splashNetworkService;

  SplashRepository() {
    splashNetworkService = SplashNetworkService();
  }

  Future<bool> haveTokenAndValid() async {
    try {
      bool status = await splashNetworkService.haveTokenFromServerValid();
      print(status);
      return status;
    }
    catch (e) {
      rethrow;
    }
  }
}