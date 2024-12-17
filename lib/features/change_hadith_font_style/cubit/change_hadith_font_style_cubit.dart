import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';

part 'change_hadith_font_style_state.dart';

class ChangeHadithFontStyleCubit extends Cubit<ChangeHadithFontStyleState> {
  ChangeHadithFontStyleCubit(this.localStorage) : super(ChangeHadithFontStyleState(AppFontsEnum.scheherazade));
  final ILocalStorage localStorage;

  void getSavedFontStyle() async {
    String savedData = localStorage.read<String>(AppStorageKeys.hadithFontStyle) ?? '';

    if (savedData.isEmpty) return;

    emit(ChangeHadithFontStyleState(AppFontsEnum.values.firstWhere((element) => element.name == savedData)));
  }

  void updateFontStyle(AppFontsEnum newData) async {
    localStorage.write(AppStorageKeys.hadithFontStyle, newData.name);

    emit(ChangeHadithFontStyleState(newData));
  }
}
