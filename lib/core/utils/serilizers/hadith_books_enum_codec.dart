import 'dart:convert';

import '../../core.dart';

class HadithBooksEnumCodec extends Codec<HadithBooksEnum, String> {
  @override
  Converter<String, HadithBooksEnum> get decoder => _HadithBooksEnumDecoder();

  @override
  Converter<HadithBooksEnum, String> get encoder => _HadithBooksEnumEncoder();
}

class _HadithBooksEnumDecoder extends Converter<String, HadithBooksEnum> {
  @override
  HadithBooksEnum convert(String input) {
    return HadithBooksEnum.values.firstWhere((e) => e.toString() == input);
  }
}

class _HadithBooksEnumEncoder extends Converter<HadithBooksEnum, String> {
  @override
  String convert(HadithBooksEnum input) {
    return input.toString();
  }
}
