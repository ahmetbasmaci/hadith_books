part of 'on_board_cubit.dart';

class OnBoardState extends Equatable {
  final int currentPage;
  const OnBoardState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}