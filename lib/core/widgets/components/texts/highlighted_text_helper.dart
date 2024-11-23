import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class HighlightedTextHelper {
  final TextStyle highlightedTextStyle;
  final TextStyle normalTextStyle;
  final double maxWidth;
  final String text;
  final List<String> searchWords;
  final List<TextSpan> spans;

  List<TextSpan> getSpansSentenceOld({
    required String text,
    required List<String> searchWords,
    required TextStyle highlightedTextStyle,
    required TextStyle normalTextStyle,
  }) {
    if (searchWords.isEmpty) {
      // no search words
      return [TextSpan(text: text, style: normalTextStyle)];
    }

    final List<TextSpan> spans = [];
    final List<String> words = text.split(' ');
    final bool isSingleSearchWord = searchWords.length == 1;

    int searchWordIndex = 0;
    String currentPhrase = '';

    for (final word in words) {
      final String normalizedWord = word.removeTashkil;
      if (searchWords.isEmpty) {
        _addWordSpan(word, normalTextStyle);
        continue;
      }
      if (isSingleSearchWord) {
        // if (true) {
        bool mustBeHighlighted = normalizedWord.contains(searchWords[0].removeTashkil);
        _addWordSpan(word, mustBeHighlighted ? highlightedTextStyle : normalTextStyle);
      } else {
        final bool isMatch = normalizedWord == searchWords[searchWordIndex].removeTashkil;

        if (isMatch) {
          currentPhrase += '$word ';
          searchWordIndex++;

          if (searchWordIndex == searchWords.length) {
            _addWordSpan(currentPhrase.trim(), highlightedTextStyle);

            currentPhrase = '';
            searchWordIndex = 0;
          }
        } else {
          if (currentPhrase.isNotEmpty) {
            _addWordSpan(currentPhrase, normalTextStyle);
            currentPhrase = '';
          }
          _addWordSpan(word, normalTextStyle);
          searchWordIndex = 0;
        }
      }
    }

    // Add any remaining phrase
    if (currentPhrase.isNotEmpty) {
      _addWordSpan(currentPhrase.trim(), normalTextStyle);
    }

    return spans;
  }

  HighlightedTextHelper({
    required this.highlightedTextStyle,
    required this.normalTextStyle,
    required this.maxWidth,
    required this.text,
    required this.searchWords,
  }) : spans = [];
  List<TextSpan> getSpansSentence() {
    if (searchWords.isEmpty) {
      // no search words
      return [TextSpan(text: text, style: normalTextStyle)];
    }

    //? find the search word in the text

    // check if the search words are only one word
    final bool isSingleSearchWord = searchWords.length == 1;

    // split the text into lines
    List<String> lines = _splitTextToLines();

    // loop through the lines to find the search word
    for (int lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      String line = lines[lineIndex];
      final List<String> lineWords = line.split(' ');

      if (isSingleSearchWord) {
        for (final lineWord in lineWords) {
          if (!lineWord.removeTashkil.contains(searchWords[0].removeTashkil)) continue;

          // Add the line before, containing, and after the matched word
          _add3LinesToSpans(
            lineIndex,
            lines,
            line,
            searchWords[0],
            highlightedTextStyle,
            normalTextStyle,
            isSingleSearchWord,
          );

          return spans;
        }
      } else {
        // Handle multiple search words
        String searchSentence = searchWords.join(' ');
        String normalizedLine = line.removeTashkil;
        // Check if the search sentence is in same line
        if (!normalizedLine.contains(searchSentence)) {
          String searchFirstWord = searchSentence.split(' ')[0];
          if (normalizedLine.contains(searchFirstWord)) {
            if (lineIndex + 1 <= lines.length - 1) {
              String multibleLines = '$normalizedLine ${lines[lineIndex + 1].removeTashkil}';
              if (multibleLines.removeTashkil.contains(searchSentence)) {
                line = multibleLines;
              } else {
                continue;
              }
            } else {
              continue;
            }
          } else {
            continue;
          }
        }
        // Add the line before, containing, and after the matched word
        _add3LinesToSpans(
          lineIndex,
          lines,
          line,
          searchSentence,
          highlightedTextStyle,
          normalTextStyle,
          isSingleSearchWord,
        );

        return spans;
      }
    }

    // If no match is found, return the normal text
    return [TextSpan(text: text, style: normalTextStyle)];
  }

  void _add3LinesToSpans(
    int lineIndex,
    List<String> lines,
    String line,
    String searchWord,
    TextStyle highlightedTextStyle,
    TextStyle normalTextStyle,
    bool isSingleSearchWord,
  ) {
    // Check if the match is in the first, middle, or last line
    bool isMathcInFirstLine = lineIndex == 0;
    bool isMathcInMiddleLine = lineIndex > 0 && lineIndex < lines.length - 1;
    bool isMathcInLastLine = lineIndex == lines.length - 1;

    if (isMathcInFirstLine) {
      // Add the first line, the matched line, and the next two lines
      _addLineIncludeSearchWord(line, searchWord, isSingleSearchWord);
      if (lineIndex + 1 < lines.length - 1) _addWordSpan(lines[lineIndex + 1], normalTextStyle);
      if (lineIndex + 1 < lines.length - 2) _addWordSpan(lines[lineIndex + 2], normalTextStyle);
    } else if (isMathcInMiddleLine) {
      // Add the previous line, the matched line, and the next line
      _addWordSpan(lines[lineIndex - 1], normalTextStyle);
      _addLineIncludeSearchWord(line, searchWord, isSingleSearchWord);
      _addWordSpan(lines[lineIndex + 1], normalTextStyle);
    } else if (isMathcInLastLine) {
      // Add the previous two lines, the matched line, and the last line
      if (lineIndex - 2 > 0) _addWordSpan(lines[lineIndex - 2], normalTextStyle);
      if (lineIndex - 1 > 0) _addWordSpan(lines[lineIndex - 1], normalTextStyle);
      _addLineIncludeSearchWord(line, searchWord, isSingleSearchWord);
    }
  }

  List<String> _splitTextToLines() {
    List<String> lines = [];

    // split the text into words
    final List<String> words = text.removeNoneTextCharecters.split(' ');

    String currentLine = '';
    // Use TextPainter to measure text and determine line breaks
    final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (final word in words) {
      if (word.isEmpty) continue;
      final String testLine = currentLine.isEmpty ? word : '$currentLine $word';
      textPainter.text = TextSpan(text: testLine, style: normalTextStyle);
      textPainter.layout(maxWidth: maxWidth);

      if (textPainter.width >= maxWidth) {
        lines.add(currentLine);
        currentLine = word;
      } else {
        currentLine = testLine;
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }
    return lines;
  }

  void _addWordSpan(String word, TextStyle style) {
    spans.add(TextSpan(text: word, style: style));
    spans.add(TextSpan(text: ' ', style: null));
  }

  void _addLineIncludeSearchWord(String line, String searchWord, bool isSingleSearchWord) {
    if (isSingleSearchWord) {
      var lineWords = line.split(' ');
      for (var word in lineWords) {
        String normalizedWord = word.removeTashkil;
        bool founded = normalizedWord.contains(searchWord);

        _addWordSpan(word, founded ? highlightedTextStyle : normalTextStyle);
      }
    } else {
      var lineWords = line.split(' ');

      int startIndex = -1;
      List<String> searchWords = searchWord.split(' ');
      for (var i = 0; i < lineWords.length; i++) {
        for (var j = 0; j < searchWords.length; j++) {
          String lineWordNormilized = lineWords[i].removeTashkil;
          bool mathced = j == searchWords.length - 1
              ? lineWordNormilized == searchWords[j]
              : lineWordNormilized.contains(searchWords[j]);
          if (mathced) {
            if (startIndex == -1) {
              startIndex = i;
            }
            i++;
          } else if (j == 0) {
            break;
          } else {
            startIndex = -1;
            break;
          }
        }
        if (startIndex > -1) break;
      }
      for (var i = 0; i < lineWords.length; i++) {
        bool mathcedWord = i >= startIndex && i < startIndex + searchWords.length;

        _addWordSpan(lineWords[i], mathcedWord ? highlightedTextStyle : normalTextStyle);
      }
    }
  }

  List<TextSpan> getSpansWords({
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
