import 'package:saffrun_app/data_managment/base_networkservice.dart';

class AdminNetworkService extends BaseNetworkService {
  Future<bool> followAdmin(int adminId) async {
    await postTemplate('/profile/follow/', {'employee_id': adminId});
    return true;
  }

  dynamic fetchAdminNetworkService(i) async {
    return await getTemplateInLink('/profile/client/business/', i);
  }

  Future<double> postRateOfAdminToServer(int ownerId, double value) async {
    try {
      dynamic rate = await postTemplate(
          '/profile/business/rate/', {'employee_id': ownerId, 'rate': value});

      return rate['new_rate'];
    } catch (e) {
      rethrow;
    }
  }
}
