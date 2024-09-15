import 'package:flutter/material.dart';

import '../../../core.dart';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({super.key, this.title, this.actions, this.leading, this.backgroundImage});
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: backgroundImage,
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Show title only when the app bar is collapsed
            bool isCollapsed = constraints.biggest.height <= kToolbarHeight + 10;
            return isCollapsed ? Text(title ?? '', style: AppStyles.titleMeduimBold) : const SizedBox.shrink();
          },
        ),
      ),
      actions: actions,
      leading: leading,
      expandedHeight: context.height * .3,
    );
  }
}