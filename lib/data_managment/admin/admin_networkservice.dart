import 'package:saffrun_app/data_managment/base_networkservice.dart';

class AdminNetworkService extends BaseNetworkService {
  Future<bool> followAdmin(int adminId) async {
    await postTemplate('/profile/follow/', {'employee_id': adminId});
    return true;
  }

  dynamic fetchAdminNetworkService(i) async {
    return await getTemplateInLink('/core/client/business/', i);
  }
}
