import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class HorizontalSpace extends StatelessWidget {
  HorizontalSpace.small({super.key}) : space = AppSizes.smallSpace;
  HorizontalSpace.medium({super.key}) : space = AppSizes.mediumSpace;
  HorizontalSpace.large({super.key}) : space = AppSizes.largeSpace;
  HorizontalSpace.xLarge({super.key}) : space = AppSizes.xLargeSpace;
  HorizontalSpace.xxLarge({super.key}) : space = AppSizes.xxLargeSpace;
  const HorizontalSpace.customize({super.key, required this.space});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
