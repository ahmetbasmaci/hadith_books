import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../features.dart';

class HadithViewTempDataListPageView extends StatelessWidget {
  const HadithViewTempDataListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeleton.shade(child: HadithViewPageSliderContainer(itemsLength: 1)),
        HadithCardItem.tempData(isPageView: true),
      ],
    );
  }
}
