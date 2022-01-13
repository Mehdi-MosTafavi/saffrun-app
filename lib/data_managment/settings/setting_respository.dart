import 'package:saffrun_app/data_managment/settings/setting_networkservice.dart';

class SettingRepository {
  late SettingNetworkService settingNetworkService;

  SettingRepository() {
    settingNetworkService = SettingNetworkService();
  }

  Future<bool> sendInfo(Map<String, dynamic> userInfo) async {
    bool status = await settingNetworkService.sendInfoToServer(userInfo);
    if (status) {
      return true;
    }

    throw ('error');
  }
}