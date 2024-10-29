import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/params/add_new_user_message_params.dart';
import '../../app_developer.dart';

part 'app_developer_state.dart';

class AppDeveloperCubit extends Cubit<AppDeveloperState> {
  final AppDeveloperSaveMessageToDbUseCase appDeveloperSaveMessageToDbUseCase;

  AppDeveloperCubit(this.appDeveloperSaveMessageToDbUseCase) : super(AppDeveloperInitialState());

  TextEditingController messageTxtCtr = TextEditingController();
  TextEditingController nameTxtCtr = TextEditingController();

  Future<void> sendMessageToDb() async {
    // String? error = _validateInput();

    // if (error != null) {
    //   emit(AppDeveloperErrorMessage(error));
    //   return;
    // }

    await _saveMessageToDb();
  }

  // String? _validateInput() {
  //   if (nameTxtCtr.text.isEmpty) {
  //     return 'الرجاء التأكد من كتابة الاسم';
  //   } else if (messageTxtCtr.text.isEmpty) {
  //     return 'الرجاء التأكد من كتابة الرسالة';
  //   }
  //   return null;
  // }

  Future<void> _saveMessageToDb() async {
    emit(AppDeveloperLoadingState());
    var response = await appDeveloperSaveMessageToDbUseCase
        .call(AddNewUserMessageParams(name: nameTxtCtr.text, message: messageTxtCtr.text));
    response.fold(
      (l) => emit(AppDeveloperErrorMessage(l.message)),
      (r) {
        // messageTxtCtr.clear();
        // nameTxtCtr.clear();
        emit(AppDeveloperSuccesState());
      },
    );
  }
}
