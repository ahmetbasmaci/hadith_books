import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/packages/local_storage/local_storage.dart';
import '../../../core/utils/resources/app_storage_keys.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this._localStorage) : super(const LocaleState('ar'));

  final ILocalStorage _localStorage;
  void getSavedLocale() {
    String savedLocaleName = _localStorage.read<String>(AppStorageKeys.locale) ?? '';
    if (savedLocaleName.isEmpty) return;

    emit(LocaleState(savedLocaleName));
  }

  void changeLocale(String localeName) {
    _localStorage.write(AppStorageKeys.locale, localeName);

    emit(LocaleState(localeName));
  }
}
