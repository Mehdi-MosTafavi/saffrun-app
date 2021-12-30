import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/admin/admin_respository.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';

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

  Future<void> fetchEvent(int id) async {
    emit(AdminLoading());
    try {
      Admin admin = await adminRepository.fetchAdminRespository(id);
      emit(AdminLoad(admin));
    } catch (e) {
      emit(AdminError());
    }
  }
}
