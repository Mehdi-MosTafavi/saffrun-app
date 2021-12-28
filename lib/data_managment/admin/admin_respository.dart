import 'package:saffrun_app/data_managment/admin/admin_networkservice.dart';

class AdminRepository {
  late AdminNetworkService adminNetworkService;

  AdminRepository() {
    adminNetworkService = AdminNetworkService();
  }
}
