// import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/turnover/turnover_card_model.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class TurnoverCardWidget extends StatelessWidget {
  TurnoverCardWidget({
    Key? key,
    required this.turnover_card,
  }) : super(key: key);

  DateTime now = DateTime.now();
  final Turnover_card turnover_card;
  final String item = 'assets/images/mafia1.jpg';

  int current = 0;
  final CarouselController controller = CarouselController();

  String getStatus(Turnover_card event, DateTime now) {
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
          return "-";
        }
    // break;

      default:
        {
          return "";
        }
    // break;
    }
  }

  Color getColor(Turnover_card event) {
    switch (event.status) {
      case 1:
        {
          return Colors.green;
        }
      // break;

      case 2:
        {
          return Colors.yellow;
        }
      // break;

      case 3:
        {
          return Colors.red;
        }
      // break;

      default:
        {
          return Colors.white;
        }
      // break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: context.height() * 0.15,
                              width: context.width() * 0.35,
                              decoration: BoxDecoration(
                                  boxShadow: defaultBoxShadow(),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(item)),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))),
                            ),
                            // SizedBox(
                            //   width: context.width() * 0.05,
                            // ),

                            Padding(
                              padding: EdgeInsets.only(
                                right: 8,
                                top: 8,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    turnover_card.title,
                                    style: boldTextStyle(color: colorPallet3),
                                  ),
                                  10.height,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Icon(
                                            LineAwesomeIcons.wavy_money_bill,
                                            color: colorPallet2,
                                          ),
                                          2.width,
                                          const Text(
                                            'مبلغ پرداختی',
                                            style:
                                                TextStyle(color: colorPallet3),
                                          ),
                                        ],
                                      )),
                                      Text(
                                        '10000 تومان',
                                        style: boldTextStyle(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'تاریخ:',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('10 مرداد 1400'),
                                5.height,
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => EventPage()));
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        'جزئیات',
                                        style:
                                            boldTextStyle(color: colorPallet2),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingOnly(left: 5, top: 5),
                          ],
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
