import 'package:flutter/material.dart';

import '../../../../../features.dart';

class HadithViewTempDataListCards extends StatelessWidget {
  const HadithViewTempDataListCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) => HadithCardItem.tempData(
          isPageView: false),
    );
  }
}
