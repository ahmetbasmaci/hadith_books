import 'package:flutter/material.dart';

import '../../../core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.drawer,
    this.body,
    this.backgroundImage,
    this.bottomNavigationBar,
    required this.useSliver,
    this.centerTitle,
    this.useAppbar = true,
  });
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? drawer;
  final Widget? body;
  final Widget? backgroundImage;
  final Widget? bottomNavigationBar;
  final bool useSliver;
  final bool? centerTitle;
  final bool useAppbar;
  @override
  Widget build(BuildContext context) {
    return useSliver ? _scaffoldWithSliver() : _scaffoldNormal();
  }

  Widget _scaffoldWithSliver() {
    return Scaffold(
      drawer: drawer,
      body: CustomScrollView(
        slivers: [
          MySliverAppbar(
            title: title,
            actions: actions,
            leading: drawer != null ? null : leading,
            backgroundImage: backgroundImage,
          ),
          SliverToBoxAdapter(
            child: body,
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget _scaffoldNormal() {
    return SafeArea(
      child: Scaffold(
        drawer: drawer,
        appBar: useAppbar
            ? MyAppbar(
                title: title,
                centerTitle: centerTitle,
                actions: actions,
                leading: drawer != null ? null : leading,
              )
            : null,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget _scaffoldWithCard(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      // appBar: useAppbar
      //     ? MyAppbar(
      //         title:  title,
      //         centerTitle: centerTitle,
      //         actions: actions,
      //         leading: drawer != null ? null : leading,
      //       )
      //     : null,
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            // if (useAppbar)
            Container(
              height: context.width * 0.2 + 20,
              width: context.width,
              decoration: BoxDecoration(
                color: context.themeColors.primary.withOpacity(.1),
              ),
            ),
            Positioned(
              top: context.width * 0.2,
              child: Container(
                width: context.width,
                height: context.height,
                decoration: BoxDecoration(
                  color: context.themeColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.borderRadius),
                    topRight: Radius.circular(AppSizes.borderRadius),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: body,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
