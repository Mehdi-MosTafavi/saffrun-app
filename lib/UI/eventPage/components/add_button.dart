import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/UI/utils/painter/dash.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';

void showDialogForParticipantEvent(BuildContext context)
{
  showDialog(
      context: context,
      // useSafeArea: false,
      // useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            // contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              height: context.height() * 0.35,
              width: context.width() * 0.8,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height() * 0.1,
                    ),
                    Text(
                      'اضافه شدن به رویداد؟',
                      style: boldTextStyle(),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: context.height() * 0.1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: boxDecorationWithRoundedCorners(
                                backgroundColor: colorPallet3),
                            child: Center(
                              child: Text(
                                'تایید',
                                style: boldTextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: boxDecorationWithRoundedCorners(
                                backgroundColor: colorPallet3),
                            child: Center(
                              child: Text(
                                'لغو',
                                style: boldTextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      });
}
