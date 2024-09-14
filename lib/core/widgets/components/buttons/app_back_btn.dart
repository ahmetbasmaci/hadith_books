import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppBackBtn extends StatelessWidget {
  const AppBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AppIcons.backBtn,
      onPressed: () {
        NavigatorHelper.pop();
      },
    );
  }
}
