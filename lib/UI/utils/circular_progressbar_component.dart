import 'package:flutter/material.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
        spinnerDuration: 1500,
        size: 50,
        customColors: CustomSliderColors(
            dynamicGradient: true,
            progressBarColors: [
              colorCircularProgressBar,
              colorCircularProgressBar
            ],
            trackColors: [Color(0xffD13438), Color(0xffCA5010)],
            dotColor: Color(0xffEA005E)),
        spinnerMode: true,
      )),
    );
  }
}
