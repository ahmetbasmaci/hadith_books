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
    required this.iconColor ,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
        tileColor: context.theme.colorScheme.surface,
        iconColor: iconColor,
        title: Text(title),
        subtitle: Text(subtitle),
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
