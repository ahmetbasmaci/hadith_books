import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final List<String> words;
  final TextStyle higlihtedTextStyle;
  final TextStyle normalTextStyl;

  const HighlightedText({
    super.key,
    required this.text,
    required this.words,
    required this.higlihtedTextStyle,
    required this.normalTextStyl,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    var splitedText = text.split(' ');
    for (var contentWord in splitedText) {
      final cleanContentWord = contentWord.removeTashkil;
      String foundedWord = '';

      if (foundedWord.isEmpty) {
        for (var searchWord in words) {
          if (cleanContentWord.contains(searchWord)) {
            foundedWord = searchWord;
            break;
          }
        }
      }

      if (foundedWord.isNotEmpty) {
        spans.add(TextSpan(text: contentWord, style: higlihtedTextStyle));
      } else {
        spans.add(TextSpan(text: contentWord, style: normalTextStyl));
      }
      spans.add(const TextSpan(text: ' '));
      spans.add(const TextSpan(text: ' '));
    }

    return SelectableText.rich(
      textAlign: TextAlign.justify,
      selectionHeightStyle: BoxHeightStyle.max,
      TextSpan(children: spans, style: normalTextStyl),
    );
  }
}

