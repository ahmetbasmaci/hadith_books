import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import '../../../../core/helpers/navigator_helper.dart';
import '../../../../src/app_router.dart';
import '../hadith_home_cubit/hadith_home_cubit.dart';

class HadithHomePage extends StatelessWidget {
  const HadithHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadith Home Page'),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: HadithBooksEnum.values.length,
          itemBuilder: (context, index) {
            return ListTile(
              // title: Text(HadithBooksEnum.values[index].bookName),
              onTap: () {
                // Navigator.of(context).pushNamed(HadithBooksEnum.values[index].bookRoute);
              },
            );
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: HadithBooksEnum.values.length,
        itemBuilder: (context, index) {
          return BlocBuilder<HadithHomeCubit, HadithHomeState>(
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  // var hadithBookEntity =
                  //     await context.read<HadithHomeCubit>().getHadithBook(HadithBooksEnum.values[index]);
                  // if (hadithBookEntity != null) {
                  // }
                    NavigatorHelper.pushNamed(AppRoutes.hadithsViewPage, extra: HadithBooksEnum.values[index]);
                },
                child: Card(
                  child: Column(
                    children: [
                      Text(HadithBooksEnum.values[index].bookName),
                      Image.asset(HadithBooksEnum.values[index].bookImage),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
