import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challange_stenlyrachmad/global/dimension.dart';
import 'package:flutter_challange_stenlyrachmad/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find<SplashController>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: Dimension.height200,
            child: Image.asset(
              'assets/image/header-splash.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: Dimension.height80,
            child: Image.asset(
              'assets/image/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: Dimension.height300,
            child: Image.asset(
              'assets/image/footer-splash.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
