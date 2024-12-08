import 'package:hadith_books/core/core.dart';

class GetAutherByIdUseCaseParams {
  final int autherId;

  GetAutherByIdUseCaseParams(this.autherId);
}
class GetAutherByHadithBookEnumParams {
  final HadithBooksEnum hadithBookEnum;

  GetAutherByHadithBookEnumParams(this.hadithBookEnum);
}
