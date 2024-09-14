import 'package:flutter/material.dart';

import '../../../../core.dart';

class BottomSheetSelectionTitle extends StatelessWidget {
  const BottomSheetSelectionTitle({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppStyles.titleBigBold);
  }
}
