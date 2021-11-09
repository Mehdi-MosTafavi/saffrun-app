import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';
import 'package:saffrun_app/models/event/event_model.dart';
import 'package:saffrun_app/UI/admin/components/event_card.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({
    Key? key,
    required this.first_text,
    required this.second_text,
  }) : super(key: key);
  final int first_text;
  final String second_text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Text(
              '$first_text',
              style: boldTextStyle(
                color: colorPallet5,
              ),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              second_text,
              style: boldTextStyle(
                color: colorPallet5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
