// import 'dart:async';

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/history/reserve_model.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class ReserveCardWidget extends StatefulWidget {
  ReserveCardWidget({
    Key? key,
    required this.reserve,
  }) : super(key: key);

  final Reserve reserve;

  // static const IconData trash = IconData(0xf4c4, fontFamily: iconFont, fontPackage: iconFontPackage);

  @override
  _ReserveCardWidgetState createState() => _ReserveCardWidgetState();
}

class _ReserveCardWidgetState extends State<ReserveCardWidget> {
  final String item = 'assets/images/mafia1.jpg';
  DateTime now = DateTime.now();
  late final Reserve reserve;
  late Timer everySecond;

  @override
  void initState() {
    super.initState();
    reserve = widget.reserve;
    everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    everySecond.cancel();
    super.dispose();
  }

  int current = 0;
  final CarouselController controller = CarouselController();

  String getStatus(Reserve reserve, DateTime now) {
    switch (reserve.status) {
      case 1:
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(reserve.startTime).inDays.round();
          final difference_hour =
              date.difference(reserve.startTime).inHours.round();
          final difference_minute =
              date.difference(reserve.startTime).inMinutes.round();
          final difference_second =
              date.difference(reserve.startTime).inSeconds.round();

          if (difference_day > 0) {
            // return difference_day.toString() + " روز";
            // return (difference_hour - difference_day * 24 - hours).toString() + ":" +
            //     (difference_minute - difference_hour * 60 - minutes).toString() + ":" +
            //     (difference_second - difference_minute * 60 - seconds).toString();
            return (difference_hour - difference_day * 24).abs().toString() +
                ":" +
                (difference_minute - difference_hour * 60).abs().toString() +
                ":" +
                (difference_second - difference_minute * 60).abs().toString();
          } else {
            return (difference_hour - difference_day * 24).abs().toString() +
                ":" +
                (difference_minute - difference_hour * 60).abs().toString() +
                ":" +
                (difference_second - difference_minute * 60).abs().toString();
          }
        }
    // break;

      case 2:
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(reserve.finishTime).inDays.round();
          final difference_hour =
              date.difference(reserve.finishTime).inHours.round();
          final difference_minute =
              date.difference(reserve.finishTime).inMinutes.round();
          final difference_second =
              date.difference(reserve.finishTime).inSeconds.round();

          if (difference_day > 0) {
            return difference_day.toString() + " روز";
          } else {
            return (difference_hour - difference_day * 24).abs().toString() +
                ":" +
                (difference_minute - difference_hour * 60).abs().toString() +
                ":" +
                (difference_second - difference_minute * 60).abs().toString() +
                " مانده";
          }
        }
    // break;

      case 3:
        {
          return "اتمام یافته";
        }
      // break;

      default:
        {
          return "";
        }
      // break;
    }
  }

  Color getColor(Reserve event) {
    switch (event.status) {
      case 1:
        {
          return colorPallet5.withOpacity(0.2);
        }
      // break;

      case 2:
        {
          return colorPallet2.withOpacity(0.2);
        }
      // break;

      case 3:
        {
          return colorPallet1.withOpacity(0.2);
        }
      // break;

      default:
        {
          return colorPallet6;
        }
      // break;
    }
  }

  Color getColorText(Reserve event) {
    switch (event.status) {
      case 1:
        {
          return colorPallet5;
        }
      // break;

      case 2:
        {
          return colorPallet2;
        }
    // break;

      case 3:
        {
          return colorPallet1;
        }
      // break;

      default:
        {
          return colorPallet6;
        }
    // break;
    }
  }

  // void _iteration(){
  //   setState(() {
  //       var a=0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Jalali startDateJalali = Jalali.fromDateTime(reserve.startTime);
    Jalali endDateJalali = Jalali.fromDateTime(reserve.finishTime);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.circular(12)),
        child: IntrinsicHeight(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(color: colorPallet2, width: 10),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: context.width() * 0.05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: context.height() * 0.15,
                                    width: context.width() * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(11),
                                            bottomLeft: Radius.circular(11)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(item))),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        reserve.title,
                                        style: boldTextStyle(),
                                      ),
                                      SizedBox(
                                        height: context.height() * 0.01,
                                      ),
                                    ],
                                  ).paddingOnly(top: 20, right: 15),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: getColor(reserve)),
                                    child: Center(
                                      child: Text(
                                        getStatus(reserve, now),
                                        style: boldTextStyle(
                                            color: getColorText(reserve)),
                                      ),
                                    ),
                                  ),
                                  10.height,
                                  if (reserve.status == 1)
                                    TextButton(
                                            onPressed: () {},
                                            child: Text('لغو نوبت'))
                                        .paddingLeft(10),
                                ],
                              ).paddingTop(20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height() * 0.01,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Column(
                                //   children: [
                                //     Wrap(
                                //       direction: Axis.vertical,
                                //       textDirection: TextDirection.rtl,
                                //       children: [
                                //         Row(
                                //           mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //           children: [
                                //             Text(
                                //               'تاریخ شروع: ',
                                //               style: primaryTextStyle(),
                                //             ),
                                //             Text(
                                //               '10 آبان | 8:00',
                                //               style: boldTextStyle(),
                                //             ),
                                //           ],
                                //         ).paddingSymmetric(horizontal: 10),
                                //         Row(
                                //           mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //           children: [
                                //             Text(
                                //               'تاریخ پایان: ',
                                //               style: primaryTextStyle(),
                                //             ),
                                //             Text(
                                //               '10 آبان | 14:00',
                                //               style: boldTextStyle(),
                                //             ),
                                //           ],
                                //         ).paddingSymmetric(horizontal: 10),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'زمان نوبت:  ',
                                            style: boldTextStyle(),
                                          ),
                                          Text(
                                              getTimeReserve(
                                                      reserve.finishTime) +
                                                  ' - ' +
                                                  getTimeReserve(
                                                      reserve.startTime),
                                              style: primaryTextStyle(
                                                  color: Colors.blueGrey),
                                              maxLines: 2),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'هزینه پرداختی: ',
                                            style: boldTextStyle(),
                                          ),
                                          Text('20000 تومان',
                                              style: boldTextStyle(
                                                  color: Colors.blueGrey),
                                              maxLines: 2),
                                        ],
                                      ),
                                    ],
                                  ).paddingRight(6),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: context.width() * 0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: context.width() * 0.01,
                                      ),
                                      MaterialButton(
                                        padding: EdgeInsets.only(
                                            left: context.width() * 0.05),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventPage()));
                                        },
                                        child: Container(
                                          height: context.height() * 0.07,
                                          width: context.width() * 0.2,
                                          decoration:
                                              boxDecorationWithRoundedCorners(
                                                  backgroundColor:
                                                      colorPallet3),
                                          child: Center(
                                            child: Text(
                                              'جزئیات',
                                              style: boldTextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // SizedBox(height: 8),

                      // 10.height,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTimeReserve(DateTime time) {
    var minute = '0' + time.minute.toString();
    return time.hour.toString() +
        ':' +
        (minute).substring(minute.length - 2, minute.length);
  }
}

final List<Widget> imageSliders = imgList2
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(item),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
