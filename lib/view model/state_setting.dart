import '../model/setting_model.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingLoading extends SettingState {}

class SettingSuccess extends SettingState {
  final Setting setting;

  SettingSuccess(this.setting);
}

class SettingError extends SettingState {
  final String message;

  SettingError(this.message);
}
