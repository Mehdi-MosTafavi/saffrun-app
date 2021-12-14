// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/history/components/event_card.dart';
// import 'package:saffrun_app/UI/commentPage/commentpage.dart';
// import 'package:saffrun_app/UI/eventPage/components/add_button.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/history/event_model.dart';
import 'package:saffrun_app/models/history/reserve_model.dart';

import 'components/reserve_card.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}



List<Event> events = [
  Event(
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
  Event(
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
  Event(
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
  Event(
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
  Event(
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
  Event(
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
  Event(
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

List<Reserve> reserves = [
  Reserve(
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
  Reserve(
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
  Reserve(
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
  Reserve(
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
  Reserve(
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
  Reserve(
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
  Reserve(
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


class _HistoryPageState extends State<HistoryPage> {
  @override

  // void _iteration(){
  //   setState(() {
  //     var a=0;
  //   });
  // }
  //
  // void initState() {
  //   // reserve = widget.reserve;
  //   _iteration();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(

                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                bottom: const TabBar(
                  labelColor: colorPallet5,
                  indicatorColor: colorPallet5,
                  tabs: [
                    Tab(text: 'Events',
                        icon: Icon(Icons.favorite, color: colorPallet5,)),
                    Tab(text: 'Reserves',
                        icon: Icon(Icons.music_note, color: colorPallet5,)),
                    // Tab(text: 'BIRDS', icon: Icon(Icons.search)),
                  ],
                ),
              ),
              body: TabBarView(
                  children: [
              Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 280,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  EventCardWidget(event: events[0]),
                  EventCardWidget(event: events[1]),
                  EventCardWidget(event: events[2]),
                  EventCardWidget(event: events[3]),
                  EventCardWidget(event: events[4]),
                ],
              ),
            ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 280,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          ReserveCardWidget(reserve: reserves[0]),
                          ReserveCardWidget(reserve: reserves[1]),
                          ReserveCardWidget(reserve: reserves[2]),
                          ReserveCardWidget(reserve: reserves[3]),
                          ReserveCardWidget(reserve: reserves[4]),
                        ],
                      ),
                    ),
    // Center(child: Text('BIRDS')),
    ],
    ),
    ),
    ),
    );
  }
}
