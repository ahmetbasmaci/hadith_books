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
    String readedPercentPer100Str = (readedPercent * 100).toStringAsFixed(1);
    double readedPercentPer100 = double.parse(readedPercentPer100Str);
    return Card(
      child: ListTile(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: hadithBooksEnum.bookName, style: AppStyles.smallBold),
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
                    TextSpan(text: '${hadithBooksEnum.booksCount} | ', style: AppStyles.smallBold),
                    TextSpan(text: '${AppStrings.of(context).hadithsCount}: ', style: AppStyles.small),
                    TextSpan(text: '${hadithBooksEnum.hadithsCount}', style: AppStyles.smallBold),
                  ],
                ),
              ),
            ),
            Tooltip(
              message: '%$readedPercentPer100Str  ${AppStrings.of(context).ofTheBookHaveBeenReaded}',
              child: Row(
                // key: hadithBooksEnum == HadithBooksEnum.bukhari ? AppKeys.homeScreenBookSliderKey : null,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: readedPercent,
                      backgroundColor: context.themeColors.natural.withOpacity(.2),
                      valueColor: AlwaysStoppedAnimation<Color>(context.themeColors.primary),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                    ),
                  ),
                  HorizontalSpace.medium(),
                  Text(
                    '$readedPercentPer100Str%',
                    style: AppStyles.smallBold.copyWith(
                      color: readedPercentPer100 > 66
                          ? context.themeColors.success
                          : readedPercentPer100 > 33
                              ? context.themeColors.warning
                              : context.themeColors.error,
                    ),
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

  Container _boxItem(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(hadithBooksEnum.bookImage),
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        color: context.theme.colorScheme.surface,
        //color: const Color(0xff1d1d1d),

        boxShadow: [
          BoxShadow(
            // color: AppConstants.context.theme.colorScheme.primary.withOpacity(.5),
            color: context.isDark ? Colors.grey.withOpacity(.2) : Colors.black.withOpacity(.4),
            blurRadius: 12,
            offset: const Offset(0, 0),
            spreadRadius: .5,
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(context.width * .115),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              color: context.themeColors.background,
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
                BoxShadow(
                  color: context.themeColors.primary.withOpacity(.5),
                  blurRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              hadithBooksEnum.bookName,
              style: AppStyles.normalBold,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            right: -5,
            top: -5,
            child: CountCirculeAvatar(text: hadithBooksEnum.bookId.toString()),
          ),
          Positioned(
            left: -5,
            bottom: -5,
            child: InfoCirculeAvatar(hadithBooksEnum: hadithBooksEnum),
          ),
        ],
      ),
    );
  }
}
