// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';

// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../state_managment/notification/notification_cubit.dart';
import '../utils/circular_progressbar_component.dart';
import 'components/notif_card.dart';

class NotificationCenter extends StatefulWidget {
  const NotificationCenter({Key? key}) : super(key: key);

  @override
  _NotificationCenterState createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {
  // late List<SalesData> _chartData;
  // late TooltipBehavior _tooltipBehavior;
  late BuildContext contextCubit;

  @override
  void initState() {
    // _chartData = getChartData();
    // _tooltipBehavior = TooltipBehavior(
    //     enable: true, textStyle: const TextStyle(fontFamily: 'Dana'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: RefreshIndicator(
        onRefresh: () async {
          await BlocProvider.of<NotificationCubit>(contextCubit)
              .fetchNotificationPage();
        },
        child: Scaffold(
          appBar: AppBarTitleProfileWhite(
            context,
            0,
            title: '',
            functionBack: () {},
            notifCenter: true,
          ),
          backgroundColor: Colors.white,
          body: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              contextCubit = context;
              if (state is NotificationInitial) {
                BlocProvider.of<NotificationCubit>(context)
                    .fetchNotificationPage();
              }
              if (state is NotificationLoaded) {
                return state.notifs.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.notifs.length,
                        padding: EdgeInsets.only(top: 30),
                        itemBuilder: (BuildContext context, int index) {
                          return NotificationCardWidget(
                              notification_card: state.notifs[index]);
                        })
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'هیچ پیامی وجود ندارد',
                          style: boldTextStyle(),
                        )),
                      );
              }

              return const Center(child: CircularProgressBar());
            },
          ),
        ),
      ),
    );
  }
}
