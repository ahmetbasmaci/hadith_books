import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class SettingsListTileItem<T> extends StatelessWidget {
  const SettingsListTileItem.dropDownTrailing({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.iconColor,
    required this.useShadow,
  })  : isCustomTrailing = false,
        cutomTrailing = const SizedBox();
  const SettingsListTileItem.customTrailing({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.cutomTrailing,
    required this.iconColor,
    required this.useShadow,
  })  : isCustomTrailing = true,
        items = const [],
        value = null,
        onChanged = null;
  final String title;
  final String subtitle;
  final Widget leading;
  final T? value;
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final Widget cutomTrailing;
  final Color iconColor;
  final bool isCustomTrailing;
  final bool useShadow;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: useShadow ? 5 : 0,
      child: ListTile(
        textColor: context.themeColors.onBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius)),
        tileColor: context.theme.colorScheme.surface,
        iconColor: iconColor,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(title, style: AppStyles.normal.bold),
        ),
        subtitle: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(subtitle, style: AppStyles.normal.natural),
        ),
        leading: leading,
        trailing: isCustomTrailing
            ? cutomTrailing
            : DropdownButton<T>(
                value: value,
                onChanged: onChanged,
                items: items,
              ),
      ),
    );
  }
}
