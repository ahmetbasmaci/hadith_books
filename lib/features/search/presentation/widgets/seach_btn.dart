import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SeachBtn extends StatelessWidget {
  const SeachBtn(this.hadithBookEntity, {super.key});
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AppSearch.showSearchInBook(hadithBookEntity: hadithBookEntity);
      },
      icon: AppIcons.search,
    );
  }
}
