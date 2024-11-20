part of 'home_page_screens_cubit.dart';

class HomePageScreensState extends Equatable {
  final int screenIndex;
  const HomePageScreensState(this.screenIndex);

  @override
  List<Object> get props => [screenIndex];
}
