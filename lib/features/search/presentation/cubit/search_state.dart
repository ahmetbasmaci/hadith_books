part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState(this.message);

  @override
  List<Object> get props => [message];
}
