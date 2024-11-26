import 'package:flutter/material.dart';
import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import 'expand_all_texts_option.dart';

class ExpandAllTextsSettingsListTile extends StatelessWidget {
  const ExpandAllTextsSettingsListTile({super.key, required this.useShasow});
  final bool useShasow;
  @override
  Widget build(BuildContext context) {
    return SettingsListTileItem<Brightness>.customTrailing(
      title: AppStrings.of(context).toggleExpandedAllTexts,
      subtitle: AppStrings.of(context).toggleExpandedAllTextsSubtitle,
      leading: AppIcons.expandAllTexts,
      iconColor: Colors.cyan,
      cutomTrailing: SizedBox(
        width: 100,
        child: const ExpandAllTextsOption(showText: false),
      ),
      useShadow: useShasow,
    );
  }
}
