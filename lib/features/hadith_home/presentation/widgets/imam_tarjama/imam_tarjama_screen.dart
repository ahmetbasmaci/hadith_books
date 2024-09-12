import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class ImamTarjamaScreen extends StatelessWidget {
  const ImamTarjamaScreen({super.key, required this.bookId});

  final int bookId;
  @override
  Widget build(BuildContext context) {
    var imamTarjamaFuture = context.read<HadithHomeCubit>().getImamTarjamaByBookId(bookId);

    return FutureBuilder(
      future: imamTarjamaFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const AppWaitDialog();

        var imamTarjama = snapshot.data!;
        String title = HadithLocalizationHelper.getBookImamTarjamaTitle(imamTarjama);
        return AppScaffold(
          useSliver: false,
          useAppbar: true,
          actions: const [AppBackBtn()],
          title: title,
          leading: Hero(
            tag: imamTarjama.id,
            child: Image.asset(
              HadithBooksEnum.values.firstWhere((element) => element.bookId == bookId).bookImage,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSizes.screenPadding),
                  child: Text(
                    HadithLocalizationHelper.getBookImamTarjamaDescription(imamTarjama),
                    textAlign: TextAlign.justify,
                    style:
                        AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
