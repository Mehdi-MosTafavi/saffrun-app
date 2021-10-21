import 'package:saffrun_app/data_managment/base_networkservice.dart';

class AuthNetworkService extends BaseNetworkService {
  Future<void> sendLoginDataToServer(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> sendSignUpDataToServer(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
