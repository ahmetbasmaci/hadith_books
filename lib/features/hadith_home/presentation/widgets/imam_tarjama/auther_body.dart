import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class AutherBody extends StatelessWidget {
  const AutherBody({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _header(title),
          Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Text(
              content,
              textAlign: TextAlign.justify,
              style: AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(String title) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                textAlign: TextAlign.justify,
                style: AppStyles.titleMeduimBold,
              ),
            ),
          ),
          AppBackBtn(),
        ],
      ),
    );
  }
}
