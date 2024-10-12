part of 'change_hadith_view_type_cubit.dart';

class ChangeHadithViewTypeState extends Equatable {
  final HadithViewTypeEnum hadithViewTypeEnum;
  const ChangeHadithViewTypeState(this.hadithViewTypeEnum);

  @override
  List<Object> get props => [hadithViewTypeEnum];
}
