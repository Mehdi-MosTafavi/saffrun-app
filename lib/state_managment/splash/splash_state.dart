part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoadingFromServer extends SplashState {}

class SplashGoToHomePage extends SplashState {}

class SplashGoToLoginPage extends SplashState {}

class SplashErrorState extends SplashState {}
