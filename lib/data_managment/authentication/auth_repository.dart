import 'package:saffrun_app/data_managment/authentication/auth_networkservice.dart';

import '../../models/user/user_2.dart';
import '../splash/splash_networkservice.dart';

class AuthRepository {
  late AuthNetworkService authNetworkService;

  AuthRepository() {
    authNetworkService = AuthNetworkService();
  }

  loginHandlerToRepository(String username, String password) async {
    try {
      bool status =
          await authNetworkService.sendLoginDataToServer(username, password);
      if (status) {
        dynamic result = await SplashNetworkService().fetchProfile();
        if (result == null) {
          return false;
        }
        UserProfile.userLogin = UserProfile.fromJson(result);
      }
      return status;
    } catch (error) {
      rethrow;
    }
  }

  signUpHandlerToRepository(String username, String password) async {
    try {
      return await authNetworkService.sendSignUpDataToServer(
          username, password);
    } catch (error) {
      rethrow;
    }
  }
}
