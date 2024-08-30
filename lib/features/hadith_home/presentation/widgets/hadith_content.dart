import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/utils/resources/resources.dart';
import '../../../features.dart';

class HadithContent extends StatefulWidget {
  final String content;
  final int maxLinesCount;
  const HadithContent({super.key, required this.content, this.maxLinesCount = 4});

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

          return _contentTextWidget(widget.content, textPainter, constraints, textStyle, context);
        },
      ),
    );
  }

  Widget _contentTextWidget(
      String content, TextPainter textPainter, BoxConstraints constraints, TextStyle textStyle, BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: SelectableText.rich(
        style: textStyle,
        TextSpan(
          text: _isExpanded
              ? content
              : '${content.substring(0, textPainter.getPositionForOffset(Offset(constraints.maxWidth, textPainter.preferredLineHeight * 3)).offset)}... ',
          style: textStyle,
          children: [
            TextSpan(
              text: _isExpanded ? '  ${AppStrings.of(context).readLess} ⬆️' : '${AppStrings.of(context).readMore} ⬇️',
              style: _isExpanded ? textStyle.copyWith(color: Colors.redAccent) : textStyle.copyWith(color: Colors.blue),
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
      maxLines: _isExpanded ? null : widget.maxLinesCount,
      textDirection: context.isArabicLang ? TextDirection.rtl : TextDirection.ltr,
    )..layout(maxWidth: constraints.maxWidth);
  }
}
