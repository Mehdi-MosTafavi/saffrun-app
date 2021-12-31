// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';
import 'package:saffrun_app/constants/theme_color.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:saffrun_app/UI/history/components/event_card.dart';
// import 'package:saffrun_app/UI/commentPage/commentpage.dart';
// import 'package:saffrun_app/UI/eventPage/components/add_button.dart';
// import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/turnover/turnover_card_model.dart';
// import 'package:saffrun_app/models/history/reserve_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'components/turnover_card.dart';

class TurnOver extends StatefulWidget {
  const TurnOver({Key? key}) : super(key: key);

  @override
  _TurnOverState createState() => _TurnOverState();
}

List<Turnover_card> turnovers = [
  Turnover_card(
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
  Turnover_card(
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
  Turnover_card(
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
  Turnover_card(
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
  Turnover_card(
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
  Turnover_card(
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
  Turnover_card(
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

class _TurnOverState extends State<TurnOver> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  List<String> months = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
        enable: true, textStyle: const TextStyle(fontFamily: 'Dana'));

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
            Container(
              height: context.height() * 0.3,
              child: Image(
                image: AssetImage('assets/images/turnover_img.jpg'),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'رویداد ها',
                            style: boldTextStyle(color: colorPallet2),
                          ),
                          6.width,
                          Icon(
                            LineAwesomeIcons.gamepad,
                            color: colorPallet2,
                          )
                        ],
                      ),
                      Text(
                        '1000 تومان',
                        style: boldTextStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'نوبت ها',
                            style: boldTextStyle(color: colorPallet2),
                          ),
                          6.width,
                          Icon(
                            LineIcons.book,
                            color: colorPallet2,
                          )
                        ],
                      ),
                      Text(
                        '1500 تومان',
                        style: boldTextStyle(),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: colorPallet2,
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'مجموع',
                              style: boldTextStyle(color: Colors.white),
                            ),
                            6.width,
                          ],
                        ),
                        Text(
                          '1000 تومان',
                          style: boldTextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.height,
            SfCartesianChart(
              // Enable tooltip
              tooltipBehavior: _tooltipBehavior,
              axisLabelFormatter: (AxisLabelRenderDetails x) {
                return ChartAxisLabel(x.text, TextStyle(fontFamily: 'Dana'));
              },
              series: <ChartSeries>[
                LineSeries<SalesData, int>(
                    name: 'میزان هزینه',
                    color: colorPallet2,
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, int x) => x + 1,
                    dataLabelMapper: (SalesData sales, int x) => months[x],
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: false,
                        textStyle: TextStyle(fontFamily: 'Dana')),
                    yValueMapper: (SalesData sales, int x) => sales.sales)
              ],
            ),
            TurnoverCardWidget(turnover_card: turnovers[0]),
            TurnoverCardWidget(turnover_card: turnovers[1]),
            TurnoverCardWidget(turnover_card: turnovers[2]),
            TurnoverCardWidget(turnover_card: turnovers[3]),
            TurnoverCardWidget(turnover_card: turnovers[4]),

            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 20.0),
            //   height: 280,
            //   child: ListView(
            //     scrollDirection: Axis.vertical,
            //     children: <Widget>[
            //       TurnoverCardWidget(turnover_card: turnovers[0]),
            //       TurnoverCardWidget(turnover_card: turnovers[1]),
            //       TurnoverCardWidget(turnover_card: turnovers[2]),
            //       TurnoverCardWidget(turnover_card: turnovers[3]),
            //       TurnoverCardWidget(turnover_card: turnovers[4]),
            //     ],
            //   ),
            // ),

            // DefaultTabController(
            //   length: 2,
            //   child: SizedBox(
            //     height: 100.0,
            //     child: Column(
            //       children: <Widget>[
            //         const TabBar(
            //           labelColor: colorPallet5,
            //           indicatorColor: colorPallet5,
            //           tabs: [
            //             Tab(text: 'Events',
            //                 icon: Icon(Icons.favorite, color: colorPallet5,)),
            //             Tab(text: 'Reserves',
            //                 icon: Icon(Icons.music_note, color: colorPallet5,)),
            //             // Tab(text: 'BIRDS', icon: Icon(Icons.search)),
            //           ],
            //         ),
            //         Expanded(
            //           child: TabBarView(
            //             children: <Widget>[
            //               Container(
            //                 margin: EdgeInsets.symmetric(vertical: 20.0),
            //                 height: 280,
            //                 child: ListView(
            //                   scrollDirection: Axis.vertical,
            //                   children: <Widget>[
            //                     TurnoverCardWidget(turnover_card: turnovers[0]),
            //                     TurnoverCardWidget(turnover_card: turnovers[1]),
            //                     TurnoverCardWidget(turnover_card: turnovers[2]),
            //                     TurnoverCardWidget(turnover_card: turnovers[3]),
            //                     TurnoverCardWidget(turnover_card: turnovers[4]),
            //                   ],
            //                 ),
            //                 // color: Colors.yellow,
            //               ),
            //               Container(
            //                 margin: EdgeInsets.symmetric(vertical: 20.0),
            //                 height: 280,
            //                 child: ListView(
            //                   scrollDirection: Axis.vertical,
            //                   children: <Widget>[
            //                     TurnoverCardWidget(turnover_card: turnovers[0]),
            //                     TurnoverCardWidget(turnover_card: turnovers[1]),
            //                     TurnoverCardWidget(turnover_card: turnovers[2]),
            //                     TurnoverCardWidget(turnover_card: turnovers[3]),
            //                     TurnoverCardWidget(turnover_card: turnovers[4]),
            //                   ],
            //                 ),
            //                 // color: Colors.yellow,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData('فروردین', 30),
      SalesData('اردیبهشت', 5),
      SalesData('خرداد', 25),
      SalesData('تیر', 0),
      SalesData('مرداد', 10),
    ];
    return chartData;
  }

// String getMonthName(int month){
//   switch(month) {
//     case 1: {  return ''; }
//
//     case 2: {  return ''; }
//
//     case 3: {  return ''; }
//
//     case 4: {  return ''; }
//
//     case 5: {  return ''; }
//
//     case 6: {  return ''; }
//
//     case 7: {  return ''; }
//
//     case 8: {  return ''; }
//
//
//     default: { return ''; }
//   }
// }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}
