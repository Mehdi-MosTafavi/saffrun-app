part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSendingToServerState extends AuthState {}

class AuthGotoHomeState extends AuthState {}

class AuthGoToPrivacyState extends AuthState {}

class AuthErrorSendToServerState extends AuthState {}
