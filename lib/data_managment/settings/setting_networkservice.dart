import 'package:saffrun_app/data_managment/base_networkservice.dart';

class SettingNetworkService extends BaseNetworkService {
  Future<bool> sendInfoToServer(Map<String, dynamic> userInfo) async {
    try {
      dynamic result = await putTemplate('/profile/user/', userInfo);
      if (result == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
