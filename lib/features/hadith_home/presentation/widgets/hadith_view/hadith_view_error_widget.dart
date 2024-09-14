import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/local/l10n.dart';
import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithViewErrorWidget extends StatelessWidget {
  const HadithViewErrorWidget({super.key, required this.hadithBooksEnum});
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useSliver: false,
      body: Center(
        child: TextButton(
          child: Text(AppStrings.of(context).errorTryAgain, style: AppStyles.normal),
          onPressed: () {
            context.read<HadithViewCubit>().init(hadithBooksEnum);
          },
        ),
      ),
    );
  }
}
