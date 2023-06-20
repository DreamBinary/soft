import 'package:get/get.dart';
import 'package:soft/app/comp/my_header/header_logic.dart';
import 'package:soft/app/modules/three/my/my_logic.dart';
import 'package:soft/app/modules/two/calendar/calendar_logic.dart';

import '../one/teach/teach_logic.dart';
import '../zero/home/home_logic.dart';
import 'route_logic.dart';

class RouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RouteLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => HeaderLogic(), fenix: true);
    Get.lazyPut(() => MyLogic());
    Get.lazyPut(() => TeachLogic());
    Get.lazyPut(() => CalendarLogic());
  }
}
