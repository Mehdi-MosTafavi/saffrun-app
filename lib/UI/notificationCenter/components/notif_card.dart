// import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/notification/notif_model.dart';

import '../../../logical/general/size_function.dart';
import 'notif_dialog.dart';

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
  final NotificationData notification_card;
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
        margin: const EdgeInsets.only(left: 30, right: 10, bottom: 12),
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
                                  Row(
                                    children: [
                                      Text(
                                        notification_card.title,
                                        style: boldTextStyle(
                                            color: colorPallet3, size: 18),
                                      ),
                                      10.width,
                                      Text(
                                        notification_card.senderName,
                                        style: primaryTextStyle(
                                            color: colorPallet5),
                                      ),
                                    ],
                                  ),
                                  10.height,
                                  Container(
                                    width: context.width() * 0.5,
                                    child: Text(
                                      notification_card.text,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  formatTimeString(
                                      notification_card.createtime),
                                  style: TextStyle(
                                      letterSpacing: -0.6, fontSize: 13),
                                ).paddingOnly(top: 12, left: 12),
                                2.height,
                                TextButton(
                                  onPressed: () {
                                    showDialogForNotification(
                                        context, notification_card);
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
                                ).paddingOnly(bottom: 5)
                              ],
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
