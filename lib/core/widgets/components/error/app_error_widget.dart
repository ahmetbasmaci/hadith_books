import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../core.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useSliver: false,
      actions: const [AppBackBtn()],
      drawer: const SizedBox(),
      body: Center(
        child: Text(AppStrings.of(context).somethingWentWrong),
      ),
    );
  }
}
