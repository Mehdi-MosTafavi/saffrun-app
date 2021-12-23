// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:saffrun_app/UI/history/components/event_card.dart';
// import 'package:saffrun_app/UI/commentPage/commentpage.dart';
// import 'package:saffrun_app/UI/eventPage/components/add_button.dart';
// import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/notification/notif_model.dart';
// import 'package:saffrun_app/models/history/reserve_model.dart';

// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'components/notif_card.dart';
import 'components/notif_dialog.dart';

class NotificationCenter extends StatefulWidget {
  const NotificationCenter({Key? key}) : super(key: key);

  @override
  _NotificationCenterState createState() => _NotificationCenterState();
}
List<Notification_card> notifications = [
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 1,
    participant: 10,
  ),
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 2,
    participant: 10,
  ),
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 3,
    participant: 10,
  ),
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 1,
    participant: 10,
  ),
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 2,
    participant: 10,
  ),
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 3,
    participant: 10,
  ),
  Notification_card(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: '',
    status: 1,
    participant: 10,
  ),
];


class _NotificationCenterState extends State<NotificationCenter> {
  // late List<SalesData> _chartData;
  // late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // _chartData = getChartData();
    // _tooltipBehavior = TooltipBehavior(
    //     enable: true, textStyle: const TextStyle(fontFamily: 'Dana'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitleProfileWhite(
        context,
        0,
        title: '',
        functionBack: () {},
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            20.height,

            GestureDetector(
                child: NotificationCardWidget(notification_card: notifications[0]),
                onTap: (){
                  showDialogForNotification(context, notifications[0]);
                },
            ),
            GestureDetector(
              child: NotificationCardWidget(notification_card: notifications[1]),
              onTap: (){
                showDialogForNotification(context, notifications[1]);
              },
            ),
            GestureDetector(
              child: NotificationCardWidget(notification_card: notifications[2]),
              onTap: (){
                showDialogForNotification(context, notifications[2]);
              },
            ),
            GestureDetector(
              child: NotificationCardWidget(notification_card: notifications[3]),
              onTap: (){
                showDialogForNotification(context, notifications[3]);
              },
            ),
            GestureDetector(
              child: NotificationCardWidget(notification_card: notifications[4]),
              onTap: (){
                showDialogForNotification(context, notifications[4]);
              },
            ),
          ],
        ),
      ),
    );
  }
}