import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../app_developer.dart';

class AppDeveloperRepository implements IAppDeveloperRepository {
  final IAppDeveloperSaveMessageToDbDataSource appDeveloperSaveMessageToDbDataSource;

  AppDeveloperRepository(this.appDeveloperSaveMessageToDbDataSource);
  @override
  Future<Either<Failure, Unit>> saveMessageToDb(String name, String message) async {
    try {
      await appDeveloperSaveMessageToDbDataSource.saveMessageToDb(name, message);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
