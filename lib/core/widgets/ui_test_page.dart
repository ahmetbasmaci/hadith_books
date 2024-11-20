import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class UiTestPage extends StatefulWidget {
  const UiTestPage({super.key});

  @override
  State<UiTestPage> createState() => _UiTestPageState();
}

class _UiTestPageState extends State<UiTestPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      locale: const Locale('ar'),
      home: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
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
      itemBuilder: (context, index) => _hadithBookItem(context),
      itemCount: 10,
    );
  }

  Widget _hadithBookItem(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('صحيح البخاري', style: AppStyles.normalBold),
        subtitle: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text.rich(
            TextSpan(
              children: [
                //'المؤلف: الإمام البخاري\nعدد الأبواب: 123 | عدد الأحاديث: 7000'
                TextSpan(text: 'المؤلف: ', style: AppStyles.normal),
                TextSpan(text: 'الإمام البخاري' '\n', style: AppStyles.normalBold),
                TextSpan(text: 'عدد الأبواب: ', style: AppStyles.normal),
                TextSpan(text: '123 | ', style: AppStyles.normalBold),
                TextSpan(text: 'عدد الأحاديث: ', style: AppStyles.normal),
                TextSpan(text: '7000', style: AppStyles.normalBold),
              ],
            ),
          ),
        ),
        leading: SizedBox(
          width: context.width * 0.2,
          height: double.maxFinite,
          child: Image.asset(AppImages.appLogo),
        ),
        trailing: SizedBox(
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
