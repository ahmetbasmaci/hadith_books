import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';
import 'auther_body.dart';

class AutherPage extends StatefulWidget {
  const AutherPage({super.key, required this.hadithBooksEnum});

  final HadithBooksEnum hadithBooksEnum;

  @override
  State<AutherPage> createState() => _AutherPageState();
}

class _AutherPageState extends State<AutherPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  bool _isLoading = false;
  late final Auther auther;
  late final HadithBookEntity? hadithBook;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(
      () {
        setState(() {
          _currentIndex = _pageController.page!.round();
        });
      },
    );

    _getData();
  }

  Future<void> _getData() async {
    setState(() => _isLoading = true);
    final hadithHomeCubit = context.read<HadithHomeCubit>();
    hadithBook = await hadithHomeCubit.getHadithBook(widget.hadithBooksEnum);
    if (hadithBook == null) {
      setState(() => _isLoading = false);
      return;
    }
    auther = await hadithHomeCubit.getAutherById(hadithBook!.metadata.autherId);

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const AppWaitScreen();

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            AutherBody(
              title: AppStrings.of(context).bookName(hadithBook!.metadata.name),
              content: AppStrings.of(context).bookDescription(hadithBook!.metadata.description),
            ),
            AutherBody(
              title: AppStrings.of(context).autherName(auther.name),
              content: AppStrings.of(context).autherDescription(auther.description),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.jumpToPage(index),
        items: [
          BottomNavigationBarItem(icon: AppIcons.bookInfo, label: AppStrings.of(context).bookInfo),
          BottomNavigationBarItem(icon: AppIcons.imamInfo, label: AppStrings.of(context).imamInfo),
        ],
      ),
    );
  }
}
