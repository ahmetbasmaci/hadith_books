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
  final int pageIndex;

  const HadithViewLoaded(this.hadithBookEntity, this.selectedChapterId,[this.pageIndex = 0]);

  HadithViewLoaded copyWith({
    HadithBookEntity? hadithBookEntity,
    int? selectedChapterId,
    int ? pageIndex,
  }) {
    return HadithViewLoaded(
      hadithBookEntity ?? this.hadithBookEntity,
      selectedChapterId ?? this.selectedChapterId,
      pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [hadithBookEntity, selectedChapterId,pageIndex];
}

final class HadithViewError extends HadithViewState {
  final String message;

  const HadithViewError(this.message);

  @override
  List<Object> get props => [message];
}
