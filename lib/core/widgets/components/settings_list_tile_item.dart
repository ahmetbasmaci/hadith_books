import 'package:flutter/material.dart';

import '../../utils/resources/resources.dart';

class SettingsListTileItem<T> extends StatelessWidget {
  const SettingsListTileItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.iconColor,
  });
  final String title;
  final String subtitle;
  final Widget leading;
  final T value;
  final Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        textColor: AppConstants.context.themeColors.onBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
        tileColor: context.theme.colorScheme.surface,
        iconColor: iconColor,
        title: Text(title, style: AppStyles.titleSmallBold),
        subtitle: Text(subtitle, style: AppStyles.normal),
        leading: leading,
        trailing: DropdownButton<T>(
          value: value,
          onChanged: onChanged,
          items: items,
        ),
      ),
    );
  }
}
