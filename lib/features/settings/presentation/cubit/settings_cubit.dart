import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  ScrollController scrollController = ScrollController();

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
