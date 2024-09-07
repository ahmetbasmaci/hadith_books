import 'package:flutter/material.dart';

import '../../../core.dart';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({super.key, this.title, this.actions, this.leading});
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text(title ?? '', style: AppStyles.titleMeduimBold),
      actions: actions,
      leading: leading,
    );
  }
}
