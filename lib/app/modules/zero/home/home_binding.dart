import 'package:get/get.dart';
import 'package:soft/app/comp/my_header/header_logic.dart';

import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => HeaderLogic());
  }
}
