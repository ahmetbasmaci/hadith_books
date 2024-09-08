import 'package:flutter/material.dart';

import '../../../core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key, this.title, this.actions, this.leading, this.drawer, this.body, required this.useSliver});
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? drawer;
  final Widget? body;
  final bool useSliver;
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
            leading: leading,
          ),
          SliverToBoxAdapter(child: body), //its to slow when load
        ],
      ),
    );
  }

  Widget _scaffoldNormal() {
    return Scaffold(
      drawer: drawer,
      appBar: MyAppbar(
        title: title ?? '',
        actions: actions,
        leading: drawer != null ? null : const SizedBox(),
      ),
      body: body,
    );
  }
}
