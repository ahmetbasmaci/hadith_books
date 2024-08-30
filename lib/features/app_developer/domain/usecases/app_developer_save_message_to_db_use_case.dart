import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/add_new_user_message_params.dart';
import '../../app_developer.dart';

class AppDeveloperSaveMessageToDbUseCase extends IUseCase<Unit, AddNewUserMessageParams> {
  final IAppDeveloperRepository appDeveloperRepository;

  AppDeveloperSaveMessageToDbUseCase(this.appDeveloperRepository);
  @override
  Future<Either<Failure, Unit>> call(AddNewUserMessageParams params) async {
    return await appDeveloperRepository.saveMessageToDb(params.name, params.message);
  }
}
