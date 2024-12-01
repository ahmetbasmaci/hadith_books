import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class HighlightedTextHelper {
  final TextStyle highlightedTextStyle;
  final TextStyle normalTextStyle;
  final double maxWidth;
  final String text;
  final List<String> searchWords;
  final List<TextSpan> spans;
  final bool showAllContent;

  HighlightedTextHelper({
    required this.highlightedTextStyle,
    required this.normalTextStyle,
    required this.maxWidth,
    required this.text,
    required this.searchWords,
    required this.showAllContent,
  }) : spans = [];
  List<TextSpan> getSpansSentence() {
    if (searchWords.isEmpty) {
      // no search words
      return [TextSpan(text: text, style: normalTextStyle)];
    }

    if (showAllContent) {
      _showAllContentWithSearchWords();
    } else {
      _showContentWithSearchWords();
    }

    if (spans.isNotEmpty) return spans;

    // If no match is found, return the normal text
    return [TextSpan(text: text, style: normalTextStyle)];
  }

  void _showContentWithSearchWords() {
    // Check if the search words are only one word
    final bool isSingleSearchWord = searchWords.length == 1;

    // Split the text into lines
    List<String> lines = _splitTextToLines();

    for (int lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      String line = lines[lineIndex];
      final String normalizedLine = line.removeTashkil;

      if (isSingleSearchWord) {
        if (normalizedLine.contains(searchWords[0].removeTashkil)) {
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
          break;
        }
      } else {
        // Handle multiple search words
        String searchSentence = searchWords.join(' ').removeTashkil;

        if (normalizedLine.contains(searchSentence)) {
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
          break;
        } else {
          String searchFirstWord = searchWords[0].removeTashkil;
          if (normalizedLine.contains(searchFirstWord) && lineIndex + 1 < lines.length) {
            String combinedLines = '$normalizedLine ${lines[lineIndex + 1].removeTashkil}';
            if (combinedLines.contains(searchSentence)) {
              // Add the line before, containing, and after the matched word
              _add3LinesToSpans(
                lineIndex,
                lines,
                '$line ${lines[lineIndex + 1]}',
                searchSentence,
                highlightedTextStyle,
                normalTextStyle,
                isSingleSearchWord,
              );
              break;
            }
          }
        }
      }
    }
  }

  void _showAllContentWithSearchWords() {
    bool isSingleWord = searchWords.length == 1;
    var words = text.split(' ');
    if (isSingleWord) {
      for (var word in words) {
        String normalizedWord = word.removeTashkil;
        bool founded = searchWords.any((element) => normalizedWord.contains(element.removeTashkil));
        _addWordSpan(word, founded ? highlightedTextStyle : normalTextStyle);
      }
    } else {
      for (var i = 0; i < words.length; i++) {
        String normalizedWord = words[i].removeTashkil;

        bool founded = searchWords[0] == normalizedWord;
        if (founded) {
          int j = 1;
          bool isSentenceMathced = true;
          while (j < searchWords.length) {
            if (searchWords[j].removeTashkil != words[i + j].removeTashkil) {
              isSentenceMathced = false;
              break;
            }
            j++;
          }
          int endIndex = i + j;
          for (var x = i; x < endIndex; x++) {
            _addWordSpan(words[x], isSentenceMathced ? highlightedTextStyle : normalTextStyle);
          }
          i = endIndex - 1;
        } else {
          // Add not matched word
          _addWordSpan(words[i], normalTextStyle);
        }
      }
    }
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
    final List<String> words = text.removeNoneTextCharecters.split(' ');

    StringBuffer currentLine = StringBuffer();
    final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (final word in words) {
      if (word.isEmpty) continue;
      final String testLine = currentLine.isEmpty ? word : '${currentLine.toString()} $word';
      textPainter.text = TextSpan(text: testLine, style: normalTextStyle);
      textPainter.layout(maxWidth: maxWidth);

      if (textPainter.width >= maxWidth) {
        lines.add(currentLine.toString());
        currentLine.clear();
        currentLine.write(word);
      } else {
        if (currentLine.isNotEmpty) currentLine.write(' ');
        currentLine.write(word);
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine.toString());
    }
    return lines;
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

  void _addWordSpan(String word, TextStyle style) {
    spans.add(TextSpan(text: word, style: style));
    spans.add(TextSpan(text: ' ', style: null));
  }
}
