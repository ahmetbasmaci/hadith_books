import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/texts/highlighted_text.dart';
import '../../../features.dart';

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
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
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
    int contentLines = textPainter.computeLineMetrics().length;
    bool isExceedsMaxLines = contentLines > widget.maxLinesCount;

    String wantedContent = _isExpanded || !isExceedsMaxLines
        ? content
        : '${content.substring(0, textPainter.getPositionForOffset(Offset(constraints.maxWidth, textPainter.preferredLineHeight * 3)).offset)}... ';
    var higlihtedTextStyle = textStyle.copyWith(color: Colors.purple);

    List<String> words = searchWords.where((e) => e.isNotEmpty).toList();

    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: HighlightedText(
                text: wantedContent,
                words: words,
                textWithoutTashkeel: wantedContent.removeTashkil,
                higlihtedTextStyle: higlihtedTextStyle,
                normalTextStyl: textStyle,
              ),
            ),
            if (isExceedsMaxLines)
              TextSpan(
                text: _isExpanded ? '  ${AppStrings.of(context).readLess} ⬆️' : '${AppStrings.of(context).readMore} ⬇️',
                style:
                    _isExpanded ? textStyle.copyWith(color: Colors.redAccent) : textStyle.copyWith(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = _toggleExpand,
              ),
          ],
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
