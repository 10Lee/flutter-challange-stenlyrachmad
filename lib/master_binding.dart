import 'package:flutter_challange_stenlyrachmad/master_controller.dart';
import 'package:get/get.dart';

class MasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MasterController());
  }
}
