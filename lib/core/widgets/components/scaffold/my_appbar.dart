import 'package:flutter/material.dart';

import '../../../utils/resources/resources.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key, required this.title, required this.actions, this.leading,this.centerTitle});
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppStyles.titleMeduimBold),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
