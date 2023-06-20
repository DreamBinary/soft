import 'package:get/get.dart';

import 'check_logic.dart';

class CheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckLogic());
  }
}
