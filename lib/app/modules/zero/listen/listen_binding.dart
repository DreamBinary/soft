import 'package:get/get.dart';

import 'listen_logic.dart';

class ListenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListenLogic());
  }
}
