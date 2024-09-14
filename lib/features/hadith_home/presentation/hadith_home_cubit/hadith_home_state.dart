part of 'hadith_home_cubit.dart';

abstract class HadithHomeState extends Equatable {
  const HadithHomeState();

  @override
  List<Object> get props => [];
}

class HadithHomeInitial extends HadithHomeState {}

class HadithHomeLoading extends HadithHomeState {}

class HadithHomeError extends HadithHomeState {
  final String message;

  const HadithHomeError(this.message);

  @override
  List<Object> get props => [message];
}

