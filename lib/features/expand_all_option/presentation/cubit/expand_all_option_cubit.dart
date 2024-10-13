import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

part 'expand_all_option_state.dart';

class ExpandAllOptionCubit extends Cubit<ExpandAllOptionState> {
  ExpandAllOptionCubit(this.localStorage) : super(const ExpandAllOptionState());

  final ILocalStorage localStorage;

  void getSavedHadithViewType() async {
    bool savedData = localStorage.read<bool>(AppStorageKeys.isTextsExpanded) ?? false;

    emit(ExpandAllOptionState(savedData));
  }

  void toggleExpandAll() async {
    bool newValue = !state.isTextsExpanded;
    localStorage.write(AppStorageKeys.isTextsExpanded, newValue);

    emit(ExpandAllOptionState(newValue));
  }
}
