import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hadith_books/src/injection_manager.dart';
import 'package:workmanager/workmanager.dart';

import 'src/background_task.dart';
import 'src/hadith_books_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionManager.instance.init();
  await GetStorage.init();
  Workmanager().initialize(backgroundTask, isInDebugMode: kDebugMode);

  runApp(const HadithBooksApp());
  // runApp(DevicePreview(enabled: true, builder: (context) => const HadithBooksApp()));
}

//TODO background service to sent hadith notification
//TODO share app in drawer
//TODO google play pro images and video


/*
تطبيق الأحاديث النبوية الشريفة

تطبيق الأحاديث النبوية الشريفة هو تطبيق مبتكر يتيح للمستخدمين الوصول إلى أكثر من 15 كتابًا من كتب الأحاديث النبوية الشريفة بسهولة وسرعة. يتميز التطبيق بتصميمه البسيط وسهولة الاستخدام، مما يجعله الخيار الأمثل لكل من يرغب في قراءة الأحاديث النبوية في أي وقت ومن أي مكان.

مميزات التطبيق:
يعمل بدون إنترنت: يمكنك الوصول إلى جميع الكتب وقراءتها دون الحاجة إلى اتصال بالإنترنت.
أكثر من 15 كتابًا من كتب الحديث: يوفر التطبيق مجموعة واسعة من كتب الأحاديث النبوية الشريفة.
ميزة البحث السريع: يمكنك البحث في جميع الكتب أو في كتاب معين أو حتى في باب من كتاب معين بسرعة وسهولة.
حفظ مكان التقدم في القراءة: تتيح لك هذه الميزة العودة إلى مكان توقفك في القراءة بسهولة، مما يسهل عليك مواصلة القراءة دون فقدان مكانك. هذه الميزة تعتبر من أهم مميزات التطبيق.
حفظ الأحاديث في المفضلة: يمكنك حفظ الأحاديث المفضلة لديك والرجوع إليها بسرعة في أي وقت.
الوضع الليلي: يدعم التطبيق الوضع الليلي لتجربة قراءة مريحة في ظروف الإضاءة المنخفضة.
دعم كامل للغات: يدعم التطبيق اللغة العربية والإنجليزية بالكامل، مما يتيح للمستخدمين من مختلف اللغات الاستفادة منه.
إمكانية نسخ النص: يمكنك نسخ نص الحديث بسهولة لمشاركته أو حفظه.
مشاركة الأحاديث: يمكنك مشاركة الأحاديث مع الآخرين عبر وسائل التواصل الاجتماعي أو البريد الإلكتروني.
إضافات أخرى:
سهولة الوصول: تم تصميم التطبيق ليكون سهل الوصول والاستخدام لجميع الفئات العمرية.
البساطة في التصميم: يتميز التطبيق بتصميم بسيط وجذاب يسهل على المستخدمين التنقل بين محتوياته.


*/