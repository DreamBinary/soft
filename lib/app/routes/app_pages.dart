import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soft/app/modules/route/route_binding.dart';
import 'package:soft/app/modules/route/route_view.dart';
import 'package:soft/app/modules/three/chat/chat_view.dart';
import 'package:soft/app/modules/two/calendar/calendar_view.dart';
import 'package:soft/app/modules/zero/listen/listen_binding.dart';
import 'package:soft/app/modules/zero/listen/listen_view.dart';

import '../modules/one/teach/teach_binding.dart';
import '../modules/one/teach/teach_view.dart';
import '../modules/three/chat/chat_binding.dart';
import '../modules/two/calendar/calendar_binding.dart';
import '../modules/zero/check/check_binding.dart';
import '../modules/zero/check/check_view.dart';
import '../modules/zero/home/home_binding.dart';
import '../modules/zero/home/home_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.route,
      page: () => const RoutePage(),
      binding: RouteBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.check,
      page: () => CheckPage(),
      binding: CheckBinding(),
    ),
    GetPage(
      name: Routes.teach,
      page: () => TeachPage(),
      binding: TeachBinding(),
    ),
    GetPage(
      name: Routes.calendar,
      page: () => CalendarPage(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: Routes.listen,
      page: () => ListenPage(),
      binding: ListenBinding(),
    ),
    GetPage(
      name: Routes.chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}
