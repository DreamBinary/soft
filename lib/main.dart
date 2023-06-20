import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:statusbarz/statusbarz.dart';
import 'app/modules/route/route_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_colors.dart';

void main() async {
  // final rootDir = await MMKV.initialize();
  // splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // StatusBarControl.setTranslucent(true);

  runApp(const MyApp());
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // } else {
  //   SystemChrome.setSystemUIOverlayStyle(
  //       const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  // }
  // login();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int version = MMKVUtil.getInt(AppString.mmVersion);
  //
  // bool isLogin = MMKVUtil.getBool(AppString.mmIsLogin);
  // bool isIntro = MMKVUtil.getBool(AppString.mmIsIntro);

  @override
  void initState() {
    super.initState();
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // ApiMoney.getAbleMon();
    // ApiMoney.getExchange();

    Statusbarz.instance.setDefaultDelay = const Duration();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return KeyboardDismissOnTap(
          child: StatusbarzCapturer(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primary,
                colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: AppColors.primarySwatch)
                    .copyWith(background: AppColors.whiteBg),
              ),
              navigatorObservers: [
                Statusbarz.instance.observer,
                FlutterSmartDialog.observer
              ],
              getPages: AppPages.pages,
              initialRoute: Routes.route,
              // initialRoute: Routes.intro,

              // initialBinding: isIntro
              //     ? (isLogin ? RouteBinding() : LoginBinding())
              //     : null,
              // initialRoute: isIntro
              //     ? (isLogin ? Routes.route : Routes.login)
              //     : Routes.intro,
              builder: FlutterSmartDialog.init(),
            ),
          ),
        );
      },
    );
  }
}
