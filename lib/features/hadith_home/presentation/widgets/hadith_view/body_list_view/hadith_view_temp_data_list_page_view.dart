import 'package:flutter/material.dart';

import '../../../../../features.dart';

class HadithViewTempDataListPageView extends StatelessWidget {
  const HadithViewTempDataListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return HadithCardItem.tempData(isPageView: true);
  }
}
