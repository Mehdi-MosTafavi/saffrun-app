// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/history/components/event_card.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarTitleProfileSaffronColor(
          context,
          0,
          title: '',
          functionBack: () {},
        ),
        body: SizedBox(
          width: context.width(),
          height: context.height(),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
                child: ColoredBox(
                  color: colorPallet2,
                  child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                          text: 'رویداد ها',
                          icon: Icon(
                            LineAwesomeIcons.gamepad,
                            color: Colors.white,
                          )),
                      Tab(
                          text: 'نوبت ها',
                          icon: Icon(
                            LineAwesomeIcons.book,
                            color: Colors.white,
                          )),
                      // Tab(text: 'BIRDS', icon: Icon(Icons.search)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: ListView(
                        padding: EdgeInsets.only(top: 20),
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
                      padding: EdgeInsets.only(top: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
