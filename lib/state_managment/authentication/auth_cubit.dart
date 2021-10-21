import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/authentication/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late AuthRepository authRepository;

  AuthCubit() : super(AuthInitial()) {
    authRepository = AuthRepository();
  }

  Future<bool> loginHandler(String username, String password) async {
    emit(AuthSendingToServerState());
    try {
      await authRepository.loginHandlerToRepository(username, password);
      emit(AuthGotoHomeState());
      return true;
    } catch (error) {
      emit(AuthErrorSendToServerState());
      return false;
    }
  }

  Future<bool> signUpHandler(String username, String password) async {
    emit(AuthSendingToServerState());
    try {
      await authRepository.signUpHandlerToRepository(username, password);
      emit(AuthGoToPrivacyState());
      return true;
    } catch (error) {
      emit(AuthErrorSendToServerState());
      return false;
    }
  }
}
