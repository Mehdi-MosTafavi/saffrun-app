// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/turnover/turnover_card_model.dart';
import 'package:saffrun_app/models/user/user_2.dart';
import 'package:saffrun_app/state_managment/turnover/turnover_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/circular_progressbar_component.dart';
import '../utils/numeral/Numeral.dart';
import 'components/payment_button.dart';
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
    'دی',
    'بهمن',
    'اسفند',
    'فرورودین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر'
  ];

  bool showLoading = false;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
        enable: true, textStyle: const TextStyle(fontFamily: 'Dana'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TurnoverCubit(),
      child: Scaffold(
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
                margin: EdgeInsets.fromLTRB(16, 20, 16, 8),
                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: defaultBoxShadow()),
                child: Column(
                  children: [
                    Container(
                      height: context.height() * 0.4,
                      child: TopCard(),
                    ),
                    BlocBuilder<TurnoverCubit, TurnoverState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            showDialogForPaymentAdd(context, (int x) async {
                              print(x);
                              setState(() {
                                showLoading = true;
                              });
                              bool status =
                                  await BlocProvider.of<TurnoverCubit>(context)
                                      .addMoneyToWallet(x);
                              setState(() {
                                showLoading = false;
                              });
                              if (status) {
                                UserProfile.userLogin.wallet += x;
                                finish(context);
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: colorPallet2,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.payment,
                                        color: Colors.white, size: 24),
                                    10.width,
                                    Text('شارژ کیف پول',
                                        style: primaryTextStyle(
                                            size: 16, color: Colors.white)),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).paddingAll(16),
                        );
                      },
                    )
                  ],
                ),
              ),
              BlocBuilder<TurnoverCubit, TurnoverState>(
                builder: (context, state) {
                  if (state is TurnoverInitial) {
                    BlocProvider.of<TurnoverCubit>(context).fetchTurnOver();
                  }
                  if (state is TurnoverLoad) {
                    List<SalesData> dateChart = state.data
                        .map((e) => SalesData(e.toString(), e))
                        .toList();
                    print(getMonth(0));
                    return Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'رویداد ها',
                                          style: boldTextStyle(
                                              color: colorPallet2),
                                        ),
                                        6.width,
                                        Icon(
                                          LineAwesomeIcons.gamepad,
                                          color: colorPallet2,
                                        )
                                      ],
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${Numeral(state.eventPayment)} ت ',
                                        style: boldTextStyle(),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'نوبت ها',
                                          style: boldTextStyle(
                                              color: colorPallet2),
                                        ),
                                        6.width,
                                        Icon(
                                          LineIcons.book,
                                          color: colorPallet2,
                                        )
                                      ],
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${Numeral(state.reservePayment)} ت ',
                                        style: boldTextStyle(),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      color: colorPallet5,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'مجموع',
                                            style: boldTextStyle(
                                                color: Colors.white),
                                          ),
                                          6.width,
                                        ],
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '${Numeral(state.totalPayment)} ت ',
                                          style: boldTextStyle(
                                              color: Colors.white),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.height,
                        SfCartesianChart(
                          // Enable tooltip
                          primaryXAxis: CategoryAxis(
                              labelStyle: TextStyle(fontFamily: 'Dana')),
                          primaryYAxis: NumericAxis(
                              labelStyle: TextStyle(fontFamily: 'Dana')),

                          tooltipBehavior: _tooltipBehavior,
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                name: 'میزان هزینه',
                                color: colorPallet2,
                                dataSource: dateChart,
                                xValueMapper: (SalesData sales, int x) =>
                                    (months[getMonth(x) - 1]),
                                dataLabelMapper: (SalesData sales, int x) =>
                                    months[x],
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: false,
                                    textStyle: TextStyle(fontFamily: 'Dana')),
                                yValueMapper: (SalesData sales, int x) =>
                                    sales.sales / 1000)
                          ],
                        ),
                        ListView.builder(
                            itemBuilder: (context, index) {
                              return TurnoverCardWidget(
                                  turnover_card: state.payments[index]);
                            },
                            itemCount: state.payments.length,
                            physics: ScrollPhysics(),
                            shrinkWrap: true)
                      ],
                    );
                  }
                  return const Center(child: CircularProgressBar())
                      .paddingTop(40);
                },
              ),
              20.height,
            ],
          ),
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

  DateTime dateTime = DateTime.now();

  getMonth(int d) {
    int x = 4 - d;
    print('1 :   ' + dateTime.month.toString());
    if (dateTime.month - x > 0) {
      return dateTime.month - x;
    }
    return 12 + (dateTime.month - x);
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

class TopCard extends StatelessWidget {
  TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.account_balance_wallet,
                        color: colorPallet2, size: 30)
                    .paddingOnly(top: 8, left: 8),
                Text(" کیف پول", style: boldTextStyle(color: colorPallet4))
                    .paddingOnly(left: 8, top: 8)
                    .expand(),
              ],
            ),
          ),
          Container(
            height: context.height() * 0.3,
            child: Image(
              image: AssetImage('assets/images/turnover_img.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("مقدار حساب", style: secondaryTextStyle(size: 16))
                  .paddingOnly(right: 8, top: 8, bottom: 8),
              Text(UserProfile.userLogin.wallet.toString(),
                      style: boldTextStyle(color: colorPallet2))
                  .paddingOnly(left: 8, top: 8, bottom: 8),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Balance", style: secondaryTextStyle(size: 16)).paddingOnly(left: 8, top: 8, bottom: 8),
          //     Text("200", style: primaryTextStyle(color: colorPallet2)).paddingOnly(right: 8, top: 8, bottom: 8),
          //   ],
          // )
        ],
      ),
    );
  }
}
