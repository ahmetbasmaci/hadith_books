import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithContent extends StatefulWidget {
  final String content;
  final int maxLinesCount;
  final String searchText;
  const HadithContent({
    super.key,
    required this.content,
    required this.searchText,
    this.maxLinesCount = 5,
  });

  @override
  HadithContentState createState() => HadithContentState();
}

class HadithContentState extends State<HadithContent> {
  static final RegExp multipleSpacesRegex = RegExp(r'\s{2,}');
  bool _isExpanded = false;
  late String processedContent;

  void _toggleExpand() {
    processedContent = _processContent(widget.content);
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  String _processContent(String content) {
    return content.replaceAll(multipleSpacesRegex, ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.mediumSpace),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final textStyle =
              AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize);

          // TextPainter to measure the text and check the number of lines
          final textPainter = _createTextPainter(widget.content, textStyle, context, constraints);

          return _contentTextWidget(
            context: context,
            content: widget.content,
            textPainter: textPainter,
            constraints: constraints,
            textStyle: textStyle,
            searchWords: widget.searchText.split(' '),
          );
        },
      ),
    );
  }

  Widget _contentTextWidget({
    required BuildContext context,
    required String content,
    required TextPainter textPainter,
    required BoxConstraints constraints,
    required TextStyle textStyle,
    required List<String> searchWords,
  }) {
    // check if the total number of lines exceeds the maximum number of lines
    final List<LineMetrics> lines = textPainter.computeLineMetrics();
    bool isExceedsMaxLines = lines.length >= widget.maxLinesCount;

    String wantedContent = '';
    if (_isExpanded) {
      wantedContent = content;
    } else {
      if (!isExceedsMaxLines) {
        wantedContent = content;
      } else {
        final lastCharacterPosition = textPainter.getPositionForOffset(
          Offset(
            constraints.maxWidth,
            lines[widget.maxLinesCount - 1].baseline + 1000,
          ),
        );
        final TextRange textRange = TextRange(start: 0, end: lastCharacterPosition.offset);
        wantedContent = textPainter.text!.toPlainText().substring(textRange.start, textRange.end);
        wantedContent = content;
      }
    }

    var higlihtedTextStyle = textStyle.copyWith(backgroundColor: Colors.yellowAccent.withOpacity(.4));

    List<String> words = searchWords.where((e) => e.isNotEmpty).toList();

    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        textAlign: TextAlign.justify,
        style: textStyle.copyWith(color: context.themeColors.onBackground),
        child: _textWidget(textStyle, wantedContent, words, higlihtedTextStyle, isExceedsMaxLines, context),
      ),
    );
  }

  Text _textWidget(
    TextStyle textStyle,
    String wantedContent,
    List<String> words,
    TextStyle higlihtedTextStyle,
    bool isExceedsMaxLines,
    BuildContext context,
  ) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: SelectableText.rich(
              TextSpan(
                children: HighlightedTextHelper.getSpans(
                  text: wantedContent,
                  words: words,
                  higlihtedTextStyle: higlihtedTextStyle,
                  normalTextStyl: textStyle,
                ),
              ),
              scrollPhysics: const NeverScrollableScrollPhysics(),
              maxLines: _isExpanded ? null : widget.maxLinesCount,
              minLines: 1,
              textAlign: TextAlign.justify,
            ),
          ),
          if (isExceedsMaxLines)
            WidgetSpan(
              child: AnimatedDefaultTextStyle(
                style:
                    _isExpanded ? textStyle.copyWith(color: Colors.redAccent) : textStyle.copyWith(color: Colors.blue),
                duration: const Duration(milliseconds: 500),
                child: InkWell(
                  onTap: _toggleExpand,
                  child: Text(_isExpanded
                      ? '  ${AppStrings.of(context).readLess} ⬆️'
                      : '${AppStrings.of(context).readMore} ⬇️'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  TextPainter _createTextPainter(
    String content,
    TextStyle textStyle,
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return TextPainter(
      text: TextSpan(text: content, style: textStyle),
      maxLines: null, // _isExpanded ? null : widget.maxLinesCount,
      textDirection: context.isArabicLang ? TextDirection.rtl : TextDirection.ltr,
    )..layout(maxWidth: constraints.maxWidth);
  }
}
