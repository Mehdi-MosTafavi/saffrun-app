import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/notification/notif_model.dart';

void showDialogForNotification(BuildContext context, Notification_card notif)
{
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
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            // contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              height: context.height() * 0.45,
              width: context.width() * 0.7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image(
                            width: MediaQuery.of(context).size.width,
                            image: AssetImage(
                                'assets/images/mafia1.jpg'),
                            height: context.height() * 0.25,
                            fit: BoxFit.cover),
                      ),
                    ),
                    20.height,
                    Text(
                      text + '\n' + text + '\n' + text + '\n' + text + '\n' + text,
                      style: boldTextStyle(),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      });
}
