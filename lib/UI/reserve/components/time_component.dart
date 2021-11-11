import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';

class TimeWidget extends StatelessWidget {
  final bool selected;
  final Reserve reserve;

  const TimeWidget({Key? key, required this.selected, required this.reserve})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: selected ? colorPallet4 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: colorPallet4, width: 3)),
          height: 45,
          width: 70,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              getTimeReserve(),
              style:
                  boldTextStyle(color: selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  String getTimeReserve() {
    return reserve.targetStartReserve.hour.toString() +
        ':' +
        reserve.targetEndReserve.minute.toString();
  }
}
