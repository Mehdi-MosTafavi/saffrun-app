// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:saffrun_app/state_managment/history/history_cubit.dart';

import '../../state_managment/history/history_event_cubit.dart';
import '../utils/circular_progressbar_component.dart';
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
    startTime: DateTime(2021, 12, 17, 22, 0, 0),
    finishTime: DateTime(2021, 12, 17, 23, 0, 0),
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
    startTime: DateTime(2021, 12, 17, 19, 0, 0),
    finishTime: DateTime(2021, 12, 17, 21, 0, 0),
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
    startTime: DateTime(2021, 12, 17, 19, 0, 0),
    finishTime: DateTime(2021, 12, 17, 21, 0, 0),
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
    startTime: DateTime(2021, 12, 17, 19, 0, 0),
    finishTime: DateTime(2021, 12, 17, 21, 0, 0),
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
    startTime: DateTime(2021, 12, 17, 19, 0, 0),
    finishTime: DateTime(2021, 12, 17, 21, 0, 0),
    comments: '',
    status: 3,
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
    startTime: DateTime(2021, 12, 17, 21, 10, 0),
    finishTime: DateTime(2021, 12, 17, 22, 0, 0),
    comments: '',
    status: 1,
    participant: 10,
  ),
  Reserve(
    id: 2,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2021, 12, 17, 19, 0, 0),
    finishTime: DateTime(2021, 12, 17, 21, 0, 0),
    comments: '',
    status: 2,
    participant: 10,
  ),
  Reserve(
    id: 3,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2021, 12, 17, 21, 10, 0),
    finishTime: DateTime(2021, 12, 17, 22, 0, 0),
    comments: '',
    status: 3,
    participant: 10,
  ),
  Reserve(
    id: 4,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2021, 12, 17, 21, 10, 0),
    finishTime: DateTime(2021, 12, 17, 22, 0, 0),
    comments: '',
    status: 3,
    participant: 10,
  ),
  Reserve(
    id: 5,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2021, 12, 17, 21, 10, 0),
    finishTime: DateTime(2021, 12, 17, 22, 0, 0),
    comments: '',
    status: 3,
    participant: 10,
  ),
  Reserve(
    id: 6,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2021, 12, 17, 21, 10, 0),
    finishTime: DateTime(2021, 12, 17, 22, 0, 0),
    comments: '',
    status: 3,
    participant: 10,
  ),
  Reserve(
    id: 7,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2021, 12, 17, 21, 10, 0),
    finishTime: DateTime(2021, 12, 17, 22, 0, 0),
    comments: '',
    status: 3,
    participant: 10,
  ),
];

class _HistoryPageState extends State<HistoryPage> {
  late BuildContext contextCubit;

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
              SizedBox(
                height: 80,
                child: ColoredBox(
                  color: colorPallet2,
                  child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: const [
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
                    BlocProvider(
                      create: (context) => HistoryCubit(),
                      child: BlocBuilder<HistoryCubit, HistoryState>(
                        builder: (context, state) {
                          contextCubit = context;
                          if (state is HistoryInitial) {
                            BlocProvider.of<HistoryCubit>(context).fetchEvent();
                          }
                          print(state);
                          if (state is HistoryLoaded) {
                            return Container(
                              child: ListView.builder(
                                padding: EdgeInsets.only(top: 20),
                                scrollDirection: Axis.vertical,
                                itemCount: state.events.length,
                                itemBuilder: (context, index) {
                                  return EventCardWidget(
                                    event: state.events[index],
                                  );
                                },
                              ),
                            );
                          }
                          return const Center(child: CircularProgressBar());
                        },
                      ),
                    ),
                    BlocProvider(
                      create: (context) => HistoryReserveCubit(),
                      child:
                          BlocBuilder<HistoryReserveCubit, HistoryEventState>(
                        builder: (context, state) {
                          contextCubit = context;

                          if (state is HistoryEventInitial) {
                            BlocProvider.of<HistoryReserveCubit>(context)
                                .fetchReserve();
                          }
                          if (state is HistoryEventLoaded) {
                            return Container(
                              padding: EdgeInsets.only(top: 20),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return ReserveCardWidget(
                                    reserve: state.reserves[index],
                                  );
                                },
                                itemCount: state.reserves.length,
                              ),
                            );
                          }
                          return const Center(child: CircularProgressBar());
                        },
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
