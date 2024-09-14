import 'package:flutter/material.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/drawer/drawer_item_animation.dart';

import '../../../../../core/core.dart';

class DrawerHeaderPart extends StatelessWidget {
  const DrawerHeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerItemAnimation(
      duration: const Duration(milliseconds: 500),
      child: DrawerHeader(
        duration: const Duration(milliseconds: 500),
        key: UniqueKey(),
        child: Image.asset(AppImages.appLogo),
      ),
    );
  }
}
