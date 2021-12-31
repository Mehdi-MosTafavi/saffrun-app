import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';

// import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/notification/notif_model.dart';

import '../../../logical/general/size_function.dart';

void showDialogForNotification(BuildContext context, NotificationData notif) {
  String text = "texttexttexttext";
  showDialog(
      context: context,
      // useSafeArea: false,
      // useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            // contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              height: context.height() * 0.34,
              width: context.width() * 0.7,
              padding: EdgeInsets.all(5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notif.title,
                              style: boldTextStyle(color: colorPallet3),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  LineIcons.clock_1,
                                  color: Colors.black,
                                ),
                                4.width,
                                Text(
                                  formatTimeString(notif.createtime),
                                  style: TextStyle(
                                      fontSize: 15, letterSpacing: -0.4),
                                ),
                              ],
                            ),
                            // Text(
                            //   notification_card.title,
                            //   style: boldTextStyle(color: colorPallet3),
                            // ),
                          ],
                        ),
                        5.height,
                        SizedBox(
                          height: 10.0,
                          width: context.width(),
                          child: Divider(
                            color: Colors.red,
                          ),
                        ),
                        10.height,
                        Text(
                          'متن پیام:',
                          style: boldTextStyle(color: colorPallet5),
                        ),
                        Container(
                          height: context.height() * 0.15,
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            children: [
                              Text(
                                notif.text,
                                style: boldTextStyle(),
                                textDirection: TextDirection.rtl,
                              ).paddingOnly(right: 7),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: () {
                          finish(context);
                        },
                        hoverColor: Colors.white,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 50,
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: Colors.white,
                            border: Border.all(
                              color: colorPallet3,
                              width: 5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'متوجه شدم',
                              style: boldTextStyle(color: colorPallet3),
                            ),
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 15),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      });
}
