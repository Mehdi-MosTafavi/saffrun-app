// import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/notification/notif_model.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class NotificationCardWidget extends StatelessWidget {
  NotificationCardWidget({
    Key? key,
    required this.notification_card,
  }) : super(key: key);

  DateTime now = DateTime.now();
  final Notification_card notification_card;
  final String item = 'assets/images/mafia1.jpg';

  int current = 0;
  final CarouselController controller = CarouselController();


String text = "texttexttexttext";

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
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    notification_card.title,
                                    style: boldTextStyle(color: colorPallet3),
                                  ),
                                  10.height,
                                  Text(text + '\n' + text),
                                  Text('10 مرداد 1400',style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ),

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
