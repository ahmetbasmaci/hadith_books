import 'package:flutter/material.dart';

import '../../../core.dart';

class AppWaitScreen extends StatelessWidget {
  const AppWaitScreen({super.key});

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
