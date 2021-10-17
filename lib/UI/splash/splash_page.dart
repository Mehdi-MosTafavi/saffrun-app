import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffrun_app/UI/utils/circular_progressbar_component.dart';
import 'package:saffrun_app/constants/const.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/logical/general/size_function.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  startTime() {
    var _duration = const Duration(seconds: 1, milliseconds: 400);
    return Timer(_duration, navigationToHomePage);
  }

  void navigationToHomePage() {
    Get.offNamed(AUTH_MENU_PATH);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(),
        width: getWidth(),
        // padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: colorBackgroundSplash),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            scale: 0.1,
                            image: AssetImage('assets/images/logo.png'))),
                  ),
                ),
              ),
            ),
            const CircularProgressBar(),
          ],
        ),
      ),
    );
  }
}
