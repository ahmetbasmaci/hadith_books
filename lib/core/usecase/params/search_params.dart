import 'package:equatable/equatable.dart';
import 'package:hadith_books/features/search/data/models/search_tire_node.dart';

import '../../core.dart';

class SearchParams implements Equatable {
  final String sentence;
  final List<HadithBooksEnum> hadithBookEnums;
  SearchParams(this.hadithBookEnums, this.sentence);

  @override
  List<Object?> get props => [hadithBookEnums, sentence];

  @override
  bool get stringify => true;
}

class InitSearchTriaParams implements Equatable {
  final HadithBooksEnum hadithBookEnum;
  final String langCode;
  InitSearchTriaParams(this.hadithBookEnum,this.langCode);

  @override
  List<Object?> get props => [hadithBookEnum,langCode];

  @override
  bool get stringify => true;
}
class InitAllSearchTriaParams implements Equatable {

  final String langCode;
  InitAllSearchTriaParams(this.langCode);

  @override
  List<Object?> get props => [langCode];

  @override
  bool get stringify => true;
}

class InsertAllToTriaParams implements Equatable {
  final SearchHadithInfoModel searchHadithParameterInfoModel;
  final String sentence;

  InsertAllToTriaParams(this.searchHadithParameterInfoModel, this.sentence);

  @override
  List<Object?> get props => [searchHadithParameterInfoModel, sentence];

  @override
  bool get stringify => true;
}
