// import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/history/event_model.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class EventCardWidget extends StatelessWidget {
  EventCardWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  DateTime now = DateTime.now();
  final Event event;
  final String item = 'assets/images/mafia1.jpg';

  int current = 0;
  final CarouselController controller = CarouselController();

  String getStatus(Event event, DateTime now) {
    switch (event.status) {
      case 1:
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(event.startTime).inDays.round();
          final difference_hour =
              date.difference(event.startTime).inHours.round();
          final difference_minute =
              date.difference(event.startTime).inMinutes.round();
          final difference_second =
              date.difference(event.startTime).inSeconds.round();

          if (difference_day > 0) {
            return difference_day.toString() + " روز";
          } else {
            return (difference_hour - difference_day * 24).toString() +
                ":" +
                (difference_minute - difference_hour * 60).toString() +
                ":" +
                (difference_second - difference_minute * 60).toString();
          }
        }
    // break;

      case 2:
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(event.finishTime).inDays.round();
          final difference_hour =
              date.difference(event.finishTime).inHours.round();
          final difference_minute =
              date.difference(event.finishTime).inMinutes.round();
          final difference_second =
              date.difference(event.finishTime).inSeconds.round();

          if (difference_day > 0) {
            return difference_day.toString() + " روز";
          } else {
            return (difference_hour - difference_day * 24).toString() +
                ":" +
                (difference_minute - difference_hour * 60).toString() +
                ":" +
                (difference_second - difference_minute * 60).toString();
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

  Color getColor(Event event) {
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

  Color getColorText(Event event) {
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

  @override
  Widget build(BuildContext context) {
    // Timer timer = Timer.periodic(Duration(seconds: 1), (Timer t) => buildCountWidget());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // width: context.width() * 0.3,
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
                                  Text(
                                    event.title,
                                    style: boldTextStyle(),
                                  ).paddingOnly(top: 15, right: 10),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text(getStatus(event),
                                  // style: TextStyle(color: getColor(event)),
                                  // ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: getColor(event)),
                                    child: Center(
                                      child: Text(
                                        getStatus(event, now),
                                        style: boldTextStyle(
                                            color: getColorText(event)),
                                      ),
                                    ),
                                  ).paddingTop(15),
                                  SizedBox(
                                    height: context.height() * 0.01,
                                  ),
                                  Align(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Center(
                                            child: Text(
                                              "تعداد عضو :",
                                              style: primaryTextStyle(
                                                color: colorPallet3,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              event.participant.toString(),
                                              style: boldTextStyle(
                                                color: colorPallet3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             fit: BoxFit.fitHeight,
                      //             image: AssetImage(item))),
                      //   ),
                      // ),
                      SizedBox(
                        height: context.height() * 0.01,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      // alignment: WrapAlignment.start,
                                      direction: Axis.vertical,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'تاریخ شروع: ',
                                              style: primaryTextStyle(),
                                            ),
                                            Text(
                                              '10 آبان | 8:00',
                                              style: boldTextStyle(),
                                            ),
                                          ],
                                        ).paddingSymmetric(horizontal: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'تاریخ پایان: ',
                                              style: primaryTextStyle(),
                                            ),
                                            Text(
                                              '10 آبان | 14:00',
                                              style: boldTextStyle(),
                                            ),
                                          ],
                                        ).paddingSymmetric(horizontal: 10),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: context.width() * 0.01),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EventPage()));
                                    },
                                    child: Container(
                                      height: context.height() * 0.07,
                                      width: context.width() * 0.2,
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: colorPallet3),
                                      child: Center(
                                        child: Text(
                                          'جزئیات',
                                          style: boldTextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(left: context.width() * 0.05),
                                //   child: InkWell(
                                //     onTap: () {
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: (context) => EventPage()));
                                //     },
                                //     child: Text('جزئیات',
                                //         style:
                                //         primaryTextStyle(size: 15, color: colorPallet4),
                                //         maxLines: 2),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // SizedBox(height: 8),
                      SizedBox(
                        height: context.height() * 0.01,
                      ),
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
