import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class AutherPage extends StatefulWidget {
  const AutherPage({super.key, required this.hadithBooksEnum});

  final HadithBooksEnum hadithBooksEnum;

  @override
  State<AutherPage> createState() => _AutherPageState();
}

class _AutherPageState extends State<AutherPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<HadithBookFullModel> _getData() async {
    var hadithBookFullModel = await context.read<HadithHomeCubit>().getHadithBookFullModel(widget.hadithBooksEnum);
    return hadithBookFullModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) return const AppWaitScreen();
        var hadithBookFullModel = snapshot.data as HadithBookFullModel;
        return _buildBody(hadithBookFullModel);
      },
    );
  }

  Widget _buildBody(HadithBookFullModel hadithBookFullModel) {
    return StatefulBuilder(
      builder: (context, pageViewSetState) {
        return Scaffold(
          body: SafeArea(child: _pageView(hadithBookFullModel, pageViewSetState)),
          bottomNavigationBar: _bottomNavigationBar(),
        );
      },
    );
  }

  AppBottomNavigationBar _bottomNavigationBar() {
    return AppBottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => _pageController.jumpToPage(index),
      items: [
        BottomNavigationBarItem(icon: AppIcons.bookInfo, label: AppStrings.of(context).bookInfo),
        BottomNavigationBarItem(icon: AppIcons.imamInfo, label: AppStrings.of(context).imamInfo),
      ],
    );
  }

  Widget _pageView(HadithBookFullModel hadithBookFullModel, Function pageViewSetState) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        pageViewSetState(() {
          _currentIndex = index;
        });
      },
      children: [
        AutherBody(
          title: AppStrings.of(context).bookName(hadithBookFullModel.hadithBook.metadata.name),
          animationGiftPath: AppAnimations.bookPagesAnimation,
          content: AppStrings.of(context).bookDescription(hadithBookFullModel.hadithBook.metadata.description),
        ),
        AutherBody(
          title: AppStrings.of(context).autherName(hadithBookFullModel.auther.name),
          animationGiftPath: AppAnimations.schollarAnimation,
          content: AppStrings.of(context).autherDescription(hadithBookFullModel.auther.description),
        ),
      ],
    );
  }
}
