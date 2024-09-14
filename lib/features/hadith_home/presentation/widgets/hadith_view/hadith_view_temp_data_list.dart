import 'package:flutter/material.dart';

import '../../../../features.dart';

class HadithViewTempDataList extends StatelessWidget {
  const HadithViewTempDataList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) => HadithCardItem.tempData(),
    );
  }
}
