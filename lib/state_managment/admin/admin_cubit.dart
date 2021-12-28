import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/admin/admin_respository.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  late AdminRepository adminRepository;

  AdminCubit() : super(AdminInitial()) {
    adminRepository = AdminRepository();
  }

  Future<bool> followAdmin(int i) async {
    try {
      await adminRepository.adminNetworkService.followAdmin(i);
      return true;
    } catch (e) {
      return false;
    }
  }
}
