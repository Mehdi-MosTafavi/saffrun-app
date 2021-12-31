import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/home/utils/event_home_page_card.dart';
import 'package:saffrun_app/UI/home/utils/reserve_home_page_card.dart';
import 'package:saffrun_app/models/event/event_model.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';
import 'package:saffrun_app/state_managment/home/home_page_cubit.dart';

import '../../utils/circular_progressbar_component.dart';

class NearestEventReservePage extends StatefulWidget {
  const NearestEventReservePage({Key? key}) : super(key: key);

  @override
  _NearestEventReservePageState createState() =>
      _NearestEventReservePageState();
}

class _NearestEventReservePageState extends State<NearestEventReservePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            BlocProvider.of<HomePageCubit>(context).fetchHomePage();
          }
          if (state is HomePageLoad) {
            return Container(
              // height: 200,
              width: context.width(),
              decoration: const BoxDecoration(
                  // color: Colors.red
                  ),
              child: Column(
                children: [
                  24.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'نوبت های نزدیک',
                      style: boldTextStyle(
                          textDecorationStyle: TextDecorationStyle.solid),
                    ).paddingAll(12),
                  ),
                  10.height,
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        if (state.reserves.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'هیچ نوبتی نزدیکی وجود ندارد',
                              style: boldTextStyle(),
                            )),
                          ),
                        for (Reserve reserve in state.reserves)
                          ReserveHomePageCard(
                            reserve: reserve,
                            onTapCard: () {},
                          )
                      ],
                    ),
                  ),
                  24.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'رویداد های نزدیک',
                      style: boldTextStyle(
                          textDecorationStyle: TextDecorationStyle.solid),
                    ).paddingAll(12),
                  ),
                  10.height,
                  Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          if (state.events.isEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'هیچ رویدادی نزدیکی وجود ندارد',
                                style: boldTextStyle(),
                              )),
                            ),
                          for (Event event in state.events)
                            EventHomePageCard(
                              event: event,
                            )
                        ],
                      ))
                ],
              ),
            );
          }
          return const Center(child: CircularProgressBar());
        },
      ),
    );
  }
}
