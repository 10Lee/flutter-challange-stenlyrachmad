import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  void redirect() {
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed('/login');
    });
  }

  @override
  void onReady() {
    super.onReady();
    redirect();
  }
}
