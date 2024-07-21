import 'package:flutter/material.dart';
import 'package:hadith_books/core/widgets/components/buttons/copy_button.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/share_button.dart';
import '../../../../core/widgets/components/horizontal_space.dart';
import '../../../features.dart';

class HadithCardItem extends StatelessWidget {
  const HadithCardItem({super.key, required this.hadith});
  final HadithEntity hadith;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.smallSpace),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: <Widget>[
              CountCirculeAvatar(text: hadith.id.toString()),
              HorizontalSpace.small(),
              context.isArabicLang
                  ? const Expanded(child: SizedBox())
                  : Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(hadith.english.narrator),
                      ),
                    ),
              HorizontalSpace.small(),
              FavoriteButton(hadith: hadith),
              ShareButton(content: HadithLocalizationHelper.getHadithText(hadith)),
              CopyButton(content: HadithLocalizationHelper.getHadithText(hadith)),
              // PopupMenuButton(
              //   icon: AppIcons.moreVert,
              //   itemBuilder: (context) {
              //     return [
              //       // PopupMenuItem(child: FavoriteButton(hadith: hadith)),
              //       PopupMenuItem(child: ShareButton(content: HadithLocalizationHelper.getHadithText(hadith))),
              //       PopupMenuItem(child: CopyButton(content: HadithLocalizationHelper.getHadithText(hadith))),
              //     ];
              //   },
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppSizes.mediumSpace),
            child: Text(
              HadithLocalizationHelper.getHadithText(hadith),
              style: AppStyles.normal,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
