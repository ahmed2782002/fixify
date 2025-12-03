import 'package:fixify/view%20model/state_setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/api_manager.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSetting(String accountType) async {
    emit(SettingLoading());
    final result = await ApiManager.getSetting(accountType);
    if (result != null && result.key == "success") {
      emit(SettingSuccess(result));
    } else {
      emit(SettingError("Failed to load data"));
    }
  }
}
