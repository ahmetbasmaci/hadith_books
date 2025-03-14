import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';

part 'change_font_size_slider_state.dart';

class ChangeFontSizeSliderCubit extends Cubit<ChangeFontSizeSliderState> {
  final ILocalStorage _localStorage;
  ChangeFontSizeSliderCubit(this._localStorage) : super(ChangeFontSizeSliderState.init());

  void getSavedFontSize() {
    final fontSize = _localStorage.read<double>(AppStorageKeys.fontSize);

    if (fontSize != null) {
      emit(ChangeFontSizeSliderState(fontSize));
    }
  }

  void updateFontSize(double fontSize) {
    _localStorage.write(AppStorageKeys.fontSize, fontSize);
    emit(ChangeFontSizeSliderState(fontSize));
  }
}
