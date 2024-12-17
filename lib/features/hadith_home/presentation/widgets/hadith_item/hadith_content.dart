import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithContent extends StatefulWidget {
  final String content;
  final int maxLinesCount;
  final String searchText;
  final bool useReadMoreProp;
  final bool useSelectible;
  final bool isPageView;
  const HadithContent({
    super.key,
    required this.content,
    required this.searchText,
    required this.useReadMoreProp,
    required this.useSelectible,
    required this.isPageView,
    this.maxLinesCount = 5,
  });

  @override
  HadithContentState createState() => HadithContentState();
}

class HadithContentState extends State<HadithContent> {
  static final RegExp multipleSpacesRegex = RegExp(r'\s{2,}');
  bool _isExpanded = false;
  late String processedContent;

  @override
  void initState() {
    super.initState();
  }

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
    processedContent = widget.content;
    return LayoutBuilder(
      builder: (context, constraints) {
        final normalTextStyle = AppStyles.hadithContentFontStyle;

        // TextPainter to measure the text and check the number of lines
        final textPainter = _createTextPainter(widget.content, normalTextStyle, context, constraints);

        return BlocBuilder<ExpandAllOptionCubit, ExpandAllOptionState>(
          builder: (context, state) {
            return _contentTextWidget(
              context: context,
              content: processedContent,
              textPainter: textPainter,
              constraints: constraints,
              normalTextStyle: normalTextStyle,
              searchWords: widget.searchText.split(' '),
            );
          },
        );
      },
    );
  }

  Widget _contentTextWidget({
    required BuildContext context,
    required String content,
    required TextPainter textPainter,
    required BoxConstraints constraints,
    required TextStyle normalTextStyle,
    required List<String> searchWords,
  }) {
    // check if the total number of lines exceeds the maximum number of lines
    final List<LineMetrics> lines = textPainter.computeLineMetrics();
    bool isExceedsMaxLines = lines.length >= widget.maxLinesCount;

    String wantedContent = '';
    bool isExpandedAllTexts = context.read<ExpandAllOptionCubit>().state.isTextsExpanded;
    if (_isExpanded || isExpandedAllTexts || widget.isPageView) {
      wantedContent = content;
    } else {
      if (!isExceedsMaxLines) {
        wantedContent = content;
      } else {
        TextPosition lastCharacterPosition = textPainter.getPositionForOffset(
          Offset(
            constraints.maxWidth,
            // lines[widget.maxLinesCount - 1].baseline + 10000,
            lines[widget.maxLinesCount - 1].baseline,
          ),
        );
        final TextRange textRange = TextRange(start: 0, end: lastCharacterPosition.offset);
        wantedContent = textPainter.text!.toPlainText().substring(textRange.start, textRange.end);
        if (content.length > wantedContent.length) {
          wantedContent = '${wantedContent.trimRight().substring(0, wantedContent.length - 15)} ....';
        }
      }
    }

    var highlightedTextStyle = normalTextStyle.copyWith(backgroundColor: context.themeColors.success.withOpacity(.2));

    List<String> words = searchWords.where((e) => e.isNotEmpty).toList();

    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        textAlign: TextAlign.justify,
        style: normalTextStyle.copyWith(color: context.themeColors.onBackground),
        child: _textWidget(normalTextStyle, wantedContent, words, highlightedTextStyle, isExceedsMaxLines, context),
      ),
    );
  }

  Widget _textWidget(
    TextStyle normalTextStyle,
    String wantedContent,
    List<String> words,
    TextStyle highlightedTextStyle,
    bool isExceedsMaxLines,
    BuildContext context,
  ) {
    bool isExpandedAllTexts = context.read<ExpandAllOptionCubit>().state.isTextsExpanded;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        var highlightedTextHelper = HighlightedTextHelper(
          text: widget.content,
          searchWords: words,
          highlightedTextStyle: highlightedTextStyle,
          normalTextStyle: normalTextStyle,
          maxWidth: maxWidth,
          showAllContent: _isExpanded || isExpandedAllTexts || widget.isPageView,
        );
        var readMoreTextColor =
            _isExpanded || isExpandedAllTexts ? context.themeColors.error : context.themeColors.secondary;
        return Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: widget.useSelectible
                    ? SelectableText.rich(
                        selectionHeightStyle: BoxHeightStyle.max,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        maxLines: widget.useReadMoreProp
                            ? (_isExpanded || isExpandedAllTexts ? null : widget.maxLinesCount)
                            : null,
                        minLines: 1,
                        TextSpan(children: highlightedTextHelper.getSpansSentence()),
                      )
                    : Text.rich(
                        TextSpan(
                          children: highlightedTextHelper.getSpansSentence(),
                        ),
                      ),
              ),
              _readMoreLessWidget(normalTextStyle, readMoreTextColor, isExpandedAllTexts, context, isExceedsMaxLines),
            ],
          ),
        );
      },
    );
  }

  WidgetSpan _readMoreLessWidget(TextStyle normalTextStyle, Color readMoreTextColor, bool isExpandedAllTexts,
      BuildContext context, bool isExceedsMaxLines) {
    if (!(widget.useReadMoreProp && isExceedsMaxLines)) return WidgetSpan(child: SizedBox());

    return WidgetSpan(
      child: AnimatedDefaultTextStyle(
        style: normalTextStyle.copyWith(color: readMoreTextColor),
        duration: const Duration(milliseconds: 500),
        child: isExpandedAllTexts
            ? SizedBox()
            : InkWell(
                onTap: _toggleExpand,
                child: Row(
                  children: <Widget>[
                    Text(_isExpanded ? AppStrings.of(context).readLess : AppStrings.of(context).readMore),
                    HorizontalSpace.small(),
                    _isExpanded ? AppIcons.arrowUp(readMoreTextColor) : AppIcons.arrowDown(readMoreTextColor),
                  ],
                ),
              ),
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
