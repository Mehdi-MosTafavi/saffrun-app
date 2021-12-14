part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingEnterValidValue extends SettingState {
  File file;

  SettingEnterValidValue(this.file);
}

class SettingSendingProfileData extends SettingState {}

class SettingSendProfileData extends SettingState {}

class SettingError extends SettingState {}
