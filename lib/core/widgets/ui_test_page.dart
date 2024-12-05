import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class UiTestApp extends StatelessWidget {
  const UiTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      locale: const Locale('ar'),
      home: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: UiTestPage(),
        ),
      ),
    );
  }
}

class UiTestPage extends StatefulWidget {
  const UiTestPage({super.key});

  @override
  State<UiTestPage> createState() => _UiTestPageState();
}

class _UiTestPageState extends State<UiTestPage> {
  final List<TargetFocus> targets = [];
  late final TutorialCoachMark tutorialCoachMark;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      showTutorial();
    });
    super.initState();
  }

  void showTutorial() {
    // targets.add(
    //   TargetFocus(
    //     identify: "Target 1",
    //     keyTarget: AppKeys.homeScreenSearchKey,
    //     contents: [
    //       _targetContent(),
    //     ],
    //   ),
    // );

    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: AppKeys.homeScreenSearchKey,
        contents: [
          _targetContent(
            title: 'نص الحديث',
            content: 'يعتبر هذا النص هو النص الأصلي للحديث النبوي الشريف الذي',
            isLastItem: false,
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 3",
        radius: 5,
        keyTarget: AppKeys.homeScreenBookSliderKey,
        contents: [
          _targetContent(
            title: 'عنوان الحديث',
            content: 'يعتبر هذا العنوان هو العنوان الذي يحتوي على معلومات الحديث',
            isLastItem: true,
          ),
        ],
        shape: ShapeLightFocus.RRect,
      ),
    );
    tutorialCoachMark = TutorialCoachMark(
      targets: targets, // List<TargetFocus>
      colorShadow: Colors.black.withOpacity(.2), // DEFAULT Colors.black

      // alignSkip: Alignment.bottomRight,
      // textSkip: "SKIP",
      // paddingFocus: 10,
      // opacityShadow: 0.8,
      onClickTarget: (target) {},
      onClickTargetWithTapPosition: (target, tapDetails) {
        PrinterHelper.print("target: $target");
        PrinterHelper.print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        //  PrinterHelper.print(target);
      },
      onSkip: () {
        PrinterHelper.print("skip");
        return true;
      },
      onFinish: () {
        PrinterHelper.print("finish");
      },
    );

    tutorialCoachMark.show(context: context);
  }

  TargetContent _targetContent({required String title, required String content, required bool isLastItem}) {
    return TargetContent(
      align: ContentAlign.bottom,
      child: Directionality(
        textDirection: context.isArabicLang ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          width: context.width * 0.7,
          decoration: BoxDecoration(
            color: context.themeColors.background,
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(title, style: AppStyles.normal.bold),
              VerticalSpace.medium(),
              Text(content, style: AppStyles.small),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (isLastItem) {
                        tutorialCoachMark.finish();
                      } else {
                        tutorialCoachMark.next();
                      }
                    },
                    child: Text(isLastItem ? 'Done' : 'Next'),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: HadithBookScreen(),
      ),
    );
  }
}

class HadithBookScreen extends StatelessWidget {
  const HadithBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => _hadithBookItem(context, index),
      itemCount: 10,
    );
  }

  Widget _hadithBookItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text('صحيح البخاري', style: AppStyles.normal.bold),
        subtitle: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text.rich(
            TextSpan(
              children: [
                //'المؤلف: الإمام البخاري\nعدد الأبواب: 123 | عدد الأحاديث: 7000'
                TextSpan(text: 'المؤلف: ', style: AppStyles.normal),
                TextSpan(text: 'الإمام البخاري' '\n', style: AppStyles.normal.bold),
                TextSpan(text: 'عدد الأبواب: ', style: AppStyles.normal),
                TextSpan(text: '123 | ', style: AppStyles.normal.bold),
                TextSpan(text: 'عدد الأحاديث: ', style: AppStyles.normal),
                TextSpan(text: '7000', style: AppStyles.normal.bold),
              ],
            ),
          ),
        ),
        leading: SizedBox(
          key: index == 0 ? AppKeys.homeScreenBookSliderKey : null,
          width: context.width * 0.2,
          height: double.maxFinite,
          child: Image.asset(AppImages.appLogo),
        ),
        trailing: SizedBox(
          key: index == 1 ? AppKeys.homeScreenSearchKey : null,
          width: context.width * 0.1,
          height: double.maxFinite,
          child: InkWell(
            onTap: () {},
            child: const Icon(Icons.favorite),
          ),
        ),
      ),
    );
  }
}
