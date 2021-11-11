import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';
import 'package:saffrun_app/state_managment/reserve/reserve_cubit.dart';

import 'components/card_profile_user.dart';
import 'components/time_component.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  int? selectedReserveId;
  late Reserve? nearReserve;
  late List<List<Reserve>>? listReserves;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveCubit(),
      child: Scaffold(
        body: BlocBuilder<ReserveCubit, ReserveState>(
          builder: (context, state) {
            print(state);
            if (state is ReserveInitial) {
              BlocProvider.of<ReserveCubit>(context).loadTimeReserve();
            }

            if (state is ReserveLoadedTime) {
              nearReserve = state.nearest;
              listReserves = state.reserves;
              listReserves![0].removeAt(0);
            }

            return Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 65),
                children: [
                  SizedBox(
                    height: context.height() * 0.16,
                    child: const CardProfileReserveWidget()
                        .paddingSymmetric(horizontal: 25),
                  ),
                  10.height,
                  if (state is! ReserveLoadingTime && state is! ReserveInitial)
                    SizedBox(
                      height: context.height() * 0.18,
                      child: IntrinsicHeight(
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'نزدیک ترین زمان ممکن',
                                  style: boldTextStyle(),
                                ),
                                15.height,
                                Row(
                                  children: [
                                    const Text('امروز:'),
                                    15.width,
                                    InkWell(
                                        onTap: () {
                                          selectedReserveId = nearReserve!.id;
                                          BlocProvider.of<ReserveCubit>(context)
                                              .selectedReserve(nearReserve!);
                                        },
                                        child: TimeWidget(
                                          selected: (selectedReserveId ?? -1) ==
                                              nearReserve!.id,
                                          reserve: nearReserve!,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 25),
                    ),
                  if (state is! ReserveLoadingTime && state is! ReserveInitial)
                    IntrinsicHeight(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'زمان های ممکن',
                                style: boldTextStyle(),
                              ),
                              15.height,
                              SizedBox(
                                height: context.height() * 0.39,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        Text(
                                          'روز  ' +
                                              (index + 1).toString() +
                                              " : ",
                                          style: primaryTextStyle(),
                                        ),
                                        GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1.6
                                                  // crossAxisSpacing: 5.0,
                                                  // mainAxisSpacing: 5.0,
                                                  ),
                                          itemBuilder: (context, i) {
                                            Reserve reserve =
                                                listReserves![index][i];
                                            return InkWell(
                                                onTap: () {
                                                  selectedReserveId =
                                                      reserve.id;
                                                  BlocProvider.of<ReserveCubit>(
                                                          context)
                                                      .selectedReserve(reserve);
                                                },
                                                child: TimeWidget(
                                                  selected:
                                                      (selectedReserveId ??
                                                              -1) ==
                                                          reserve.id,
                                                  reserve: reserve,
                                                ));
                                          },
                                          itemCount:
                                              listReserves![index].length,
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: listReserves!.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ).paddingSymmetric(horizontal: 25)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
