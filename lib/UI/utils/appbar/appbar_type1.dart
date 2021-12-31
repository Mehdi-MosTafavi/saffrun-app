import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/notificationCenter/notif_center.dart';
import 'package:saffrun_app/constants/theme_color.dart';

import 'appbar_base.dart';

class AppBarTitleProfileWhite extends AppBarWidget {
  final String title;
  final BuildContext context;
  final int index;
  final Function functionBack;
  final bool extend;
  final bool notifCenter;

  AppBarTitleProfileWhite(this.context, this.index,
      {Key? key,
      required this.title,
      required this.functionBack,
      this.extend = false,
      this.notifCenter = false})
      : super(key: key, parentContext: context, extend: extend);

  @override
  Widget getTitleWidget() {
    return Container();
  }

  @override
  getActions() {
    // TODO: implement getActions
    return [
      const Center(
        child: Text(
          'بازگشت',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ).paddingRight(7),
      GestureDetector(
        onTap: () {
          Navigator.pop(parentContext);
          functionBack();
        },
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.1),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ).paddingRight(10),
      ),
    ];
  }

  @override
  getLeading() {
    return !notifCenter
        ? GestureDetector(
            onTap: () {
              pushNewScreen(
                context,
                screen: const NotificationCenter(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            child: Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
          )
        : Container();
  }
}

class AppBarTitleProfileSaffronColor extends AppBarWidget {
  final String title;
  final BuildContext context;
  final int index;
  final Function functionBack;
  final bool extend;

  AppBarTitleProfileSaffronColor(this.context, this.index,
      {Key? key,
      required this.title,
      required this.functionBack,
      this.extend = false})
      : super(
            key: key,
            parentContext: context,
            extend: extend,
            color: colorPallet2);

  @override
  Widget getTitleWidget() {
    return Container();
  }

  @override
  getActions() {
    // TODO: implement getActions
    return [
      const Center(
        child: Text(
          'بازگشت',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ).paddingRight(7),
      GestureDetector(
        onTap: () {
          Navigator.pop(parentContext);
          functionBack();
        },
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.2),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ).paddingRight(10),
      ),
    ];
  }

  @override
  getLeading() {
    return GestureDetector(
        onTap: () {
          pushNewScreen(
            context,
            screen: const NotificationCenter(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        },
        child: Icon(Icons.notifications_active));
  }
}
