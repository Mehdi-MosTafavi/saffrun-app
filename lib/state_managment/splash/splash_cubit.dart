import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/splash/splash_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  late SplashRepository splashRepository;

  SplashCubit() : super(SplashInitial()) {
    splashRepository = SplashRepository();
  }

  Future<void> handlerSplashNavigation() async {
    emit(SplashLoadingFromServer());
    try {
      bool status = await splashRepository.haveTokenAndValid();
      print(status);
      emit(status ? SplashGoToHomePage() : SplashGoToLoginPage());
      return;
    } catch (e) {
      emit(SplashErrorState());
    }
  }
}
