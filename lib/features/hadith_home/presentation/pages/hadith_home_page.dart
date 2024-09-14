import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class HadithHomePage extends StatelessWidget {
  const HadithHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.of(context).appName,
      actions: const [HadithHomeSearchIcon()],
      drawer: const HadithHomeDrawer(),
      body: const HadithHomeBody(),
      useSliver: false,
    );
  }
}
