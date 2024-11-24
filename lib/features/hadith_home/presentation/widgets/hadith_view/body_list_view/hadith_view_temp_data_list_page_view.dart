import 'package:flutter/material.dart';

import '../../../../../features.dart';

class HadithViewTempDataListPageView extends StatelessWidget {
  const HadithViewTempDataListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HadithViewPageSliderContainer(startIndex: 1, endIndex: 2),
        HadithCardItem.tempData(isPageView: true),
      ],
    );
  }
}
