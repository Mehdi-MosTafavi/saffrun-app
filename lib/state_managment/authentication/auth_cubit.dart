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
      bool status =
          await authRepository.loginHandlerToRepository(username, password);
      print(status);
      if (status) {
        emit(AuthGotoHomeState());
      } else {
        emit(AuthErrorSendToServerState());
      }
      return status;
    } catch (error) {
      emit(AuthErrorSendToServerState());
      return false;
    }
  }

  Future<bool> signUpHandler(String username, String password) async {
    emit(AuthSendingToServerState());
    try {
      bool status =
          await authRepository.signUpHandlerToRepository(username, password);
      if (status) {
        emit(AuthGoToPrivacyState());
      } else {
        emit(AuthErrorSendToServerState());
      }
      return status;
    } catch (error) {
      emit(AuthErrorSendToServerState());
      return false;
    }
  }

  Future<bool> recoverPassword(String userName) async {
    emit(AuthSendingToServerState());
    try {
      bool status = await authRepository.authNetworkService
          .recoverPasswordToServer(userName);
      if (status) {
        emit(AuthGoToPrivacyState());
      } else {
        emit(AuthErrorSendToServerState());
      }
      return status;
    } catch (error) {
      emit(AuthErrorSendToServerState());
      return false;
    }
  }
}
