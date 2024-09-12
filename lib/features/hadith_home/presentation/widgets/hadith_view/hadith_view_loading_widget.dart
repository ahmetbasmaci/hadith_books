import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class HadithViewLoadingWidget extends StatelessWidget {
  const HadithViewLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      useSliver: false,
      actions: [AppBackBtn()],
      drawer: SizedBox(),
      body: AppWaitDialog(),
    );
  }
}
