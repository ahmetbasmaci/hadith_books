import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class GetAutherByIdUseCase extends IUseCaseAsync<Auther, GetAutherByIdUseCaseParams> {
  final IHadithBookRepository _hadithRepository;

  GetAutherByIdUseCase(this._hadithRepository);

  @override
  Future<Either<Failure, Auther>> call(GetAutherByIdUseCaseParams params) async {
    return await _hadithRepository.getAutherById(params.autherId);
  }
}
