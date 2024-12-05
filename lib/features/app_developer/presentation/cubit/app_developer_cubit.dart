import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/params/add_new_user_message_params.dart';
import '../../app_developer.dart';

part 'app_developer_state.dart';

class AppDeveloperCubit extends Cubit<AppDeveloperState> {
  final AppDeveloperSaveMessageToDbUseCase _appDeveloperSaveMessageToDbUseCase;

  AppDeveloperCubit(this._appDeveloperSaveMessageToDbUseCase) : super(AppDeveloperInitialState());

  TextEditingController messageTxtCtr = TextEditingController();
  TextEditingController nameTxtCtr = TextEditingController();

  @override
  Future<void> close() {
    messageTxtCtr.dispose();
    nameTxtCtr.dispose();
    return super.close();
  }

  Future<void> sendMessageToDb() async {
    await _saveMessageToDb();
  }

  Future<void> _saveMessageToDb() async {
    emit(AppDeveloperLoadingState());
    var response = await _appDeveloperSaveMessageToDbUseCase
        .call(AddNewUserMessageParams(name: nameTxtCtr.text, message: messageTxtCtr.text));
    response.fold(
      (l) => emit(AppDeveloperErrorMessage(l.message)),
      (r) {
        emit(AppDeveloperSuccesState());
      },
    );
  }
}
