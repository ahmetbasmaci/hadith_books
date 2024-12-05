import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import '../../../../../core/core.dart';
import '../../../../../src/src.dart';
import '../../../../features.dart';

class HadithBookItem extends StatelessWidget {
  const HadithBookItem({
    super.key,
    required this.hadithBooksEnum,
  });
  final HadithBooksEnum hadithBooksEnum;

  @override
  Widget build(BuildContext context) {
    return _listTileItem(context);
  }

  Widget _listTileItem(BuildContext context) {
    int currentReadedHadithId = context.read<HadithHomeCubit>().getLastReadedHadithId(hadithBooksEnum);
    double readedPercent = currentReadedHadithId / hadithBooksEnum.hadithsCount;

 
    return Card(
      child: ListTile(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: hadithBooksEnum.bookName, style: AppStyles.small.bold),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '${AppStrings.of(context).booksCount}: ', style: AppStyles.small),
                    TextSpan(text: '${hadithBooksEnum.booksCount} | ', style: AppStyles.small.bold),
                    TextSpan(text: '${AppStrings.of(context).hadithsCount}: ', style: AppStyles.small),
                    TextSpan(text: '${hadithBooksEnum.hadithsCount}', style: AppStyles.small.bold),
                  ],
                ),
              ),
            ),
            Tooltip(
              message: '%${readedPercent.percentPer100}  ${AppStrings.of(context).ofTheBookHaveBeenReaded}',
              child: Row(
                // key: hadithBooksEnum == HadithBooksEnum.bukhari ? AppKeys.homeScreenBookSliderKey : null,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: readedPercent,
                      backgroundColor: context.themeColors.natural.withOpacity(.2),
                      valueColor: AlwaysStoppedAnimation<Color>(context.themeColors.progress(readedPercent)),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                    ),
                  ),
                  HorizontalSpace.medium(),
                  Text(
                    '${readedPercent.percentPer100}%',
                    style: AppStyles.small.bold.copyWith(color: context.themeColors.progress(readedPercent)),
                  )
                ],
              ),
            ),
          ],
        ),
        leading: Image.asset(hadithBooksEnum.bookImage),
        trailing: IconButton(
          color: context.themeColors.secondary,
          onPressed: () {
            NavigatorHelper.pushNamed(
              AppRoutes.autherPage,
              extra: HadithBooksEnumCodec().encoder.convert(hadithBooksEnum),
            );
          },
          icon: AppIcons.info,
        ),
      ),
    );
  }


}
