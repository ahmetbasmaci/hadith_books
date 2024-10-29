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

    return AppScaffold(
      useSliver: false,
      useAppbar: false,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            _info(context, AppStrings.of(context).autherName(auther.name),
                AppStrings.of(context).autherDescription(auther.description)),
            _info(context, AppStrings.of(context).bookName(hadithBook!.metadata.name),
                AppStrings.of(context).bookDescription(hadithBook!.metadata.description)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.jumpToPage(index),
        items: [
          BottomNavigationBarItem(icon: AppIcons.imamInfo, label: AppStrings.of(context).imamInfo),
          BottomNavigationBarItem(icon: AppIcons.bookInfo, label: AppStrings.of(context).bookInfo),
        ],
      ),
    );
  }

  Widget _info(BuildContext context, String title, String content) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _header(title),
          Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Text(
              content,
              textAlign: TextAlign.justify,
              style: AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(String title) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Row(
        children: [
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.justify,
            style: AppStyles.titleMeduimBold,
          ),
          Spacer(),
          AppBackBtn(),
        ],
      ),
    );
  }
}
