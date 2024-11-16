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
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => _item(),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget _item2() {
    return Column(
      children: <Widget>[
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Your Interest'),
            TextButton(onPressed: () {}, child: Text('Show All')),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 300,
          width: 150,
          color: Colors.grey.withOpacity(0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 50,
                child: Container(
                  height: 200,
                  width: 150,
                  color: Color(0xfff3b8cd),
                ),
              ),
              Image.asset(AppImages.appLogo),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _item() {
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
