import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/const.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
    Get.offNamed(HOME_PAGE_PATH);
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
        padding: const EdgeInsets.all(10),
        decoration: boxDecorationDefault(color: Colors.white),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'))),
                    ),
                  )),
            ),
            SleekCircularSlider(
                appearance: CircularSliderAppearance(
              spinnerDuration: 1500,
              size: 50,
              customColors: CustomSliderColors(
                  dynamicGradient: true,
                  progressBarColors: [Color(0xffEA005E), Color(0xffE81123)],
                  trackColors: [Color(0xffD13438), Color(0xffCA5010)],
                  dotColor: Color(0xffEA005E)),
              spinnerMode: true,
            )),
          ],
        ),
      ),
    );
  }
}
