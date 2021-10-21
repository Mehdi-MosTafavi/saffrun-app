import 'package:saffrun_app/data_managment/authentication/auth_networkservice.dart';

class AuthRepository {
  late AuthNetworkService authNetworkService;

  AuthRepository() {
    authNetworkService = AuthNetworkService();
  }

  loginHandlerToRepository(String username, String password) {
    try {
      authNetworkService.sendLoginDataToServer(username, password);
    } catch (error) {
      rethrow;
    }
  }

  signUpHandlerToRepository(String username, String password) {
    try {
      authNetworkService.sendSignUpDataToServer(username, password);
    } catch (error) {
      rethrow;
    }
  }
}
