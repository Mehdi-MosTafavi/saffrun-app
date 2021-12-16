// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
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

  @override
  void initState(){
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                // height: 280,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: context.width() * 0.025,
                          top: context.height() * 0.01),
                      child: Container(
                        child: Text('TurnOvers'),
                      ),
                    ),
                    Container(
                      height: context.height() * 0.3,
                      child: Image(
                        image: AssetImage('images/turnover_img.png'),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: context.width() * 0.3,
                              right: context.width() * 0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Event'),
                                  Text('1000'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Reserve'),
                                  Text('1000'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('مجموع'),
                                  Text('2000'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SfCartesianChart(
                      series: <ChartSeries>[
                      LineSeries<SalesData, double>(
                        dataSource: _chartData,
                        xValueMapper: (SalesData sales,_) => sales.month,
                        yValueMapper: (SalesData sales,_) => sales.sales)

                      ],
                      // primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
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

  List<SalesData> getChartData(){
    final List<SalesData> chartData = [
      SalesData(0, 30),
      SalesData(1, 5),
      SalesData(2, 25),
      SalesData(3, 20),
      SalesData(4, 10),

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


class SalesData{
  SalesData(this.month, this.sales);
  final double month;
  final double sales;
}