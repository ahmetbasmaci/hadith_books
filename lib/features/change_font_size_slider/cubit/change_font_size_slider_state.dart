part of 'change_font_size_slider_cubit.dart';

class ChangeFontSizeSliderState extends Equatable {
  const ChangeFontSizeSliderState(this.fontSize);
  ChangeFontSizeSliderState.init() : fontSize = (AppSizes.maxFontSize + AppSizes.minFontSize) / 2;
  final double fontSize;
  @override
  List<Object> get props => [fontSize];
}
