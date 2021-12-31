import 'package:saffrun_app/data_managment/admin/admin_networkservice.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';

class AdminRepository {
  late AdminNetworkService adminNetworkService;

  AdminRepository() {
    adminNetworkService = AdminNetworkService();
  }

  Future<Admin> fetchAdminRespository(int i) async {
    try {
      dynamic result = await adminNetworkService.fetchAdminNetworkService(i);
      return Admin.fromJson(result);
    } catch (e) {
      print(e);
      throw ('Error');
    }
  }
}
