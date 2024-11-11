import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class HighlightedTextHelper {
  static List<TextSpan> getSpansSentence({
    required String text,
    required List<String> searchWords,
    required TextStyle highlightedTextStyle,
    required TextStyle normalTextStyle,
  }) {
    final List<TextSpan> spans = [];
    final List<String> words = text.split(' ');
    final bool isSingleSearchWord = searchWords.length == 1;

    int searchWordIndex = 0;
    String currentPhrase = '';

    for (final word in words) {
      final String normalizedWord = word.removeTashkil;
      if (searchWords.isEmpty) {
        _addWordSpan(spans, word, normalTextStyle);
        continue;
      }
      if (isSingleSearchWord) {
        // if (true) {
        bool mustBeHighlighted = normalizedWord.contains(searchWords[0].removeTashkil);
        _addWordSpan(spans, word, mustBeHighlighted ? highlightedTextStyle : normalTextStyle);
      } else {
        final bool isMatch = normalizedWord == searchWords[searchWordIndex].removeTashkil;

        if (isMatch) {
          currentPhrase += '$word ';
          searchWordIndex++;

          if (searchWordIndex == searchWords.length) {
            _addWordSpan(spans, currentPhrase.trim(), highlightedTextStyle);

            currentPhrase = '';
            searchWordIndex = 0;
          }
        } else {
          if (currentPhrase.isNotEmpty) {
            _addWordSpan(spans, currentPhrase, normalTextStyle);
            currentPhrase = '';
          }
          _addWordSpan(spans, word, normalTextStyle);
          searchWordIndex = 0;
        }
      }
    }

    // Add any remaining phrase
    if (currentPhrase.isNotEmpty) {
      _addWordSpan(spans, currentPhrase.trim(), normalTextStyle);
    }

    return spans;
  }

  static void _addWordSpan(List<TextSpan> spans, String word, TextStyle style) {
    spans.add(TextSpan(text: word, style: style));
    spans.add(const TextSpan(text: ' '));
  }

  static List<TextSpan> getSpansWords({
    required String text,
    required List<String> words,
    required TextStyle higlihtedTextStyle,
    required TextStyle normalTextStyl,
  }) {
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

      spans.add(TextSpan(text: contentWord, style: foundedWord.isNotEmpty ? higlihtedTextStyle : null));
      spans.add(const TextSpan(text: ' '));
      // spans.add(const TextSpan(text: ' '));
      // spans.add(const TextSpan(text: ' '));
    }

    return spans;
  }
}
