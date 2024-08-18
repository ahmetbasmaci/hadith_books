part of 'hadith_search_filter_cubit.dart';

sealed class HadithSearchFilterState extends Equatable {
  final List<HadithBooksEnum> selectedHadithsInSearch;
  const HadithSearchFilterState({required this.selectedHadithsInSearch});

  @override
  List<Object> get props => [selectedHadithsInSearch];
}

final class HadithSearchFilterInitial extends HadithSearchFilterState {
  const HadithSearchFilterInitial({required super.selectedHadithsInSearch});

  @override
  List<Object> get props => [selectedHadithsInSearch];
}
