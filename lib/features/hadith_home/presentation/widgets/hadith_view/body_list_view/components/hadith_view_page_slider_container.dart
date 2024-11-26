import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/features/features.dart';

class HadithViewPageSliderContainer extends StatelessWidget {
  const HadithViewPageSliderContainer({super.key, required this.startIndex, required this.endIndex});

  final double startIndex;
  final double endIndex;
  @override
  Widget build(BuildContext context) {
    double selectedPage = 0;
    var state = context.read<HadithViewCubit>().state;
    if (state is HadithViewLoaded) {
      selectedPage = state.pageIndex.toDouble();
    }

    return Container(
      width: context.width,
      height: context.width * 0.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: context.theme.colorScheme.surface),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: HadithViewPageSlider(startIndex: startIndex, length: endIndex),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSizes.smallSpace),
              child: TextField(
                controller: context.read<HadithViewCubit>().hadithPageTexyEditCtr,
                decoration: InputDecoration(
                  hintText: '${(selectedPage + startIndex).toInt()}',
                  hintStyle: AppStyles.xSmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.theme.colorScheme.onSurface, width: .5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.theme.colorScheme.onSurface, width: .5),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    int page = int.parse(value);
                    if (page > endIndex) {
                      context.read<HadithViewCubit>().hadithPageTexyEditCtr.text = endIndex.toInt().toString();
                      page = endIndex.toInt();
                    }
                    if (page < startIndex) {
                      context.read<HadithViewCubit>().hadithPageTexyEditCtr.text = startIndex.toInt().toString();
                      page = startIndex.toInt();
                    }
                    context.read<HadithViewCubit>().updateHadithPage(page - 1);
                  }
                },
                //get only int values
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                style: AppStyles.xSmall,
                textAlign: TextAlign.center,
                maxLines: 1,
                minLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
