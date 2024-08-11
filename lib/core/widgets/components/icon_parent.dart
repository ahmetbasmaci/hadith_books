import 'package:flutter/material.dart';

import '../../utils/resources/resources.dart';

class IconParent extends StatelessWidget {
  const IconParent({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
        side: BorderSide(color: context.theme.colorScheme.secondary),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.smallSpace),
        child: child,
      ),
    );
  }
}
