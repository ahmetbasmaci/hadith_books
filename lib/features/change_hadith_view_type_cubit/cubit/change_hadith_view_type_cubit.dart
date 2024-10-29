import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';

part 'change_hadith_view_type_state.dart';

class ChangeHadithViewTypeCubit extends Cubit<ChangeHadithViewTypeState> {
  ChangeHadithViewTypeCubit(this.localStorage) : super(const ChangeHadithViewTypeState(HadithViewTypeEnum.listView));

  final ILocalStorage localStorage;

  void getSavedHadithViewType() async {
    String savedData = localStorage.read<String>(AppStorageKeys.hadithViewType) ?? '';

    if (savedData.isEmpty) return;

    emit(ChangeHadithViewTypeState(HadithViewTypeEnum.values.firstWhere((element) => element.name == savedData)));
  }

  void updateHadithViewType(HadithViewTypeEnum newData) async {
    localStorage.write(AppStorageKeys.hadithViewType, newData.name);

    emit(ChangeHadithViewTypeState(newData));
  }
}
