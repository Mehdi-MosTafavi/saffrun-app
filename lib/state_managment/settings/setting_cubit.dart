import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/settings/setting_respository.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  late SettingRepository settingRepository;

  SettingCubit() : super(SettingInitial()) {
    settingRepository = SettingRepository();
  }

  void selectImage(File? file) {
    if (file != null) {
      emit(SettingEnterValidValue(file));
    }
  }

  Future<bool> sendInformationUser(Map<String, dynamic> userInfo) async {
    emit(SettingSendingProfileData());
    try {
      bool status = await settingRepository.sendInfo(userInfo);

      emit(SettingSendProfileData());
      return status;
    } catch (e) {
      emit(SettingError());
      return false;
    }
  }
}
