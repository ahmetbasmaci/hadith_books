import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class AutherBody extends StatelessWidget {
  const AutherBody({super.key, required this.title, required this.content, required this.animationGiftPath});
  final String title;
  final String content;
  final String animationGiftPath;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _header(title),
          _gift(context),
          _body(context),
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
                style: AppStyles.titleMeduim.bold,
              ),
            ),
          ),
          AppBackBtn(),
        ],
      ),
    );
  }

  Widget _gift(BuildContext context) {
    return LottieBuilder.asset(
      animationGiftPath,
      width: context.width,
      height: context.height * .2,
      repeat: false,
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Text(
        content,
        textAlign: TextAlign.justify,
        style: AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize),
      ),
    );
  }
}
