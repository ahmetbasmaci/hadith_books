part of 'home_page_screens_cubit.dart';

class HomePageScreensState extends Equatable {
  final HomePageScreensEnum selectedScreen;
  const HomePageScreensState(this.selectedScreen);

  @override
  List<Object> get props => [selectedScreen];
}
