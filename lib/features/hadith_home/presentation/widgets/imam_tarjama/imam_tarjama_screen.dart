import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class ImamTarjamaScreen extends StatefulWidget {
  const ImamTarjamaScreen({super.key, required this.bookId});

  final int bookId;

  @override
  State<ImamTarjamaScreen> createState() => _ImamTarjamaScreenState();
}

class _ImamTarjamaScreenState extends State<ImamTarjamaScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var imamTarjamaFuture = context.read<HadithHomeCubit>().getImamTarjamaByBookId(widget.bookId);

    return FutureBuilder(
      future: imamTarjamaFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppErrorWidget();
        }
        if (!snapshot.hasData) return const AppWaitScreen();

        var imamTarjama = snapshot.data!;
        String title = HadithLocalizationHelper.getBookImamTarjamaTitle(imamTarjama);

        return AppScaffold(
          useSliver: false,
          useAppbar: true,
          actions: const [AppBackBtn()],
          title: Text(title),
          centerTitle: true,
          leading: const SizedBox(),
          body: PageView(
            children: [
              _bookInfo(imamTarjama, context),
              _bookInfo(imamTarjama, context),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: AppIcons.bookInfo, label: AppStrings.of(context).bookInfo),
              BottomNavigationBarItem(icon: AppIcons.imamInfo, label: AppStrings.of(context).imamInfo),
            ],
          ),
        );
      },
    );
  }

  Widget _bookInfo(ImamsTarjamaEntity imamTarjama, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Text(
              HadithLocalizationHelper.getBookImamTarjamaDescription(imamTarjama),
              textAlign: TextAlign.justify,
              style: AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
