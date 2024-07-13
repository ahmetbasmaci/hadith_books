part of 'hadith_view_cubit.dart';

sealed class HadithViewState extends Equatable {
  const HadithViewState();

  @override
  List<Object> get props => [];
}

final class HadithViewInitial extends HadithViewState {}

final class HadithViewLoading extends HadithViewState {}

final class HadithViewLoaded extends HadithViewState {
  final HadithBookEntity hadithBookEntity;
  final int selectedChapterId;

  const HadithViewLoaded(this.hadithBookEntity, this.selectedChapterId);

  @override
  List<Object> get props => [hadithBookEntity, selectedChapterId];
}

final class HadithViewError extends HadithViewState {
  final String message;

  const HadithViewError(this.message);

  @override
  List<Object> get props => [message];
}
