import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:youtube_flutter/app/BaseView/view/base_view.dart';
import 'package:youtube_flutter/core/constants/app/app_constants.dart';
import 'package:youtube_flutter/core/constants/theme/theme_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: AppConstants.SUPPORTED_LOCALE,
    fallbackLocale: AppConstants.EN_LOCALE,
    path: AppConstants.LANG_PATH,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube Demo',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeConstants.instance.themeData,
      home: BaseView(),
    );
  }
}
