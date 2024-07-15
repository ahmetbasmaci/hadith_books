import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import '../../../../core/widgets/animations/animations.dart';
import '../hadith_home_cubit/hadith_home_cubit.dart';
import '../widgets/hadith_book_item.dart';
import '../widgets/hadith_home_drawer.dart';

class HadithHomePage extends StatelessWidget {
  const HadithHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadith Home Page'),
      ),
      drawer: const HadithHomeDrawer(),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: HadithBooksEnum.values.length,
          itemBuilder: (context, index) {
            return BlocBuilder<HadithHomeCubit, HadithHomeState>(
              builder: (context, state) {
                return AnimatedListItemUpToDown(
                  staggerDuration: const Duration(milliseconds: 5),
                  key: GlobalKey(),
                  index: index,
                  child: HadithBookItem(hadithBooksEnum: HadithBooksEnum.values[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
