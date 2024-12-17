part of 'change_hadith_font_style_cubit.dart';

class ChangeHadithFontStyleState extends Equatable {
  final AppFontsEnum hadithFontStyleEnum;
  const ChangeHadithFontStyleState(this.hadithFontStyleEnum);

  @override
  List<Object> get props => [hadithFontStyleEnum];
}
