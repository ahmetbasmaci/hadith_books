import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class AppDeveloperPage extends StatelessWidget {
  const AppDeveloperPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDeveloperCubit, AppDeveloperState>(
      builder: (context, state) {
        return _body(context);
      },
    );
  }

  Widget _body(BuildContext context) {
    return AppScaffold(
      title: AppStrings.of(context).appDeveloper,
      actions: const [AppBackBtn()],
      leading: const SizedBox(),
      useSliver: false,
      body: AnimatedBackgroundWidget(
        child: GestureDetector(
          onTap: () => AppConstants.focusScopeNode.unfocus(),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: _childeren(context),
          ),
        ),
      ),
    );
  }

  Widget _childeren(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _image(context), //developer_3d,cosrumerSurvices_3d
        _title(context),
        VerticalSpace.xLarge(),
        _description(context),
        VerticalSpace.xLarge(),
        _textFieldsTitle(context),
        // const AppDeveloperAddNameTextField(),
        // VerticalSpace.large(),
        // const AppDeveloperAddMessageTextField(),
        // VerticalSpace.xxLarge(),
        // const AppDeveloperSubmitButton(),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return ScaleAnimatedForEverWidget(
      child: Lottie.asset(
        AppAnimations.developer,
        height: context.height * .3,
        repeat: true,
      ),
    );
  }

  Text _title(BuildContext context) => Text(
        AppStrings.of(context).appDeveloperTitle,
        textAlign: TextAlign.center,
        style: AppStyles.titleMeduimBold,
      );

  Widget _description(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${AppStrings.of(context).contactMeOnEmail}:   "),
              ScaleAnimatedForEverWidget(
                child: SelectableText.rich(
                  TextSpan(
                    text: AppConstants.developerEmail,
                    style: AppStyles.titleMeduim.copyWith(color: context.themeColors.secondary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.read<AppDeveloperCubit>().sendMessageToDb(),
                  ),
                ),
              ),
            ],
          ),
        ),
        // FittedBox(
        //   fit: BoxFit.fitWidth,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('${AppStrings.of(context).orByWhatsapp}: '),
        //       SelectableText.rich(
        //         TextSpan(
        //           text: ' ${AppConstants.developerWhatsapp}',
        //           style: AppStyles.titleMeduim.copyWith(color: context.themeColors.secondary),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Text _textFieldsTitle(BuildContext context) => Text(
        AppStrings.of(context).appDeveloperDiscreption,
        textAlign: TextAlign.center,
      );
}
