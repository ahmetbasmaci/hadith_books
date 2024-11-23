import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/features/hadith_home/presentation/home_page_screens/home_page_screens_cubit.dart';
import '../widgets/home_page_bottom_navigation_bar.dart';
import '../widgets/home_page_search_appbar_widget.dart';

class HadithHomePage extends StatefulWidget {
  const HadithHomePage({super.key});

  @override
  State<HadithHomePage> createState() => _HadithHomePageState();
}

class _HadithHomePageState extends State<HadithHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: context.width,
          height: context.height,
          child: Stack(
            children: [
              HomePageSearchAppbarWidget(showBackIcon: false, showSearchIcon: true),
              _bodyContainer(context),
            ],
          ),
        ),
        bottomNavigationBar: HomePageBottomNavigationBar(),
      ),
    );
  }

  Positioned _bodyContainer(BuildContext context) {
    return Positioned(
      top: AppSizes.appbarH(context),
      child: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
          color: context.themeColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.borderRadius),
            topRight: Radius.circular(AppSizes.borderRadius),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black,
          //     offset: const Offset(0, 2),
          //     blurRadius: 10,
          //     spreadRadius: 0.1,
          //   ),
          // ],
        ),
        child: BlocBuilder<HomePageScreensCubit, HomePageScreensState>(
          builder: (context, state) {
            return context.read<HomePageScreensCubit>().bottomNavigationBarItemModels[state.screenIndex].screen;
          },
        ),
      ),
    );
  }
}
