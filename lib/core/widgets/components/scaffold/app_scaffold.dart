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
    );
  }

  Widget _scaffoldNormal() {
    return Scaffold(
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
    );
  }
}
