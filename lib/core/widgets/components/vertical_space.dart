import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class VerticalSpace extends StatelessWidget {
  VerticalSpace.small({super.key}) : space = AppSizes.smallSpace;
  VerticalSpace.medium({super.key}) : space = AppSizes.mediumSpace;
  VerticalSpace.large({super.key}) : space = AppSizes.largeSpace;
  VerticalSpace.xLarge({super.key}) : space = AppSizes.xLargeSpace;
  VerticalSpace.xxLarge({super.key}) : space = AppSizes.xxLargeSpace;
  const VerticalSpace.customize({super.key, required this.space});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
