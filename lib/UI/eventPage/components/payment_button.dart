import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/utils/numeral/Numeral.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/user/user_2.dart';

import '../../../models/event/event_model.dart';

// import 'package:saffrun_app/models/history/event_model.dart';
// import 'package:saffrun_app/models/history/reserve_model.dart';
String getWalletStatus(Event event) {
  if (event.price <= UserProfile.userLogin.wallet) {
    return "پرداخت از کیف پول";
  } else {
    return "موجودی کیف پول شما کافی نیست";
  }
}

void showDialogForPayment(
    BuildContext context, Event event, Function addParticipant) {
  int bank = -1;
  bool loading = false;
  showDialog(
      context: context,
      // useSafeArea: false,
      // useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            // contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              width: context.width(),
              height: context.height() * 0.68,
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                            child: ColoredBox(
                              color: colorPallet2,
                              child: TabBar(
                                labelColor: Colors.white,
                                indicatorColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: 'کیف پول',
                                  ),
                                  Tab(
                                    text: 'آنلاین',
                                  ),
                                  // Tab(text: 'BIRDS', icon: Icon(Icons.search)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  color: Color(0xffF5F5F5),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(top: 20),
                                    scrollDirection: Axis.vertical,
                                    children: <Widget>[
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          child: Image(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              image: AssetImage(
                                                  'assets/images/wallet.png'),
                                              height: context.height() * 0.4,
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                            maxWidth: context.width() * 0.5),
                                        height: 50,
                                        width: 50,
                                        decoration:
                                            boxDecorationWithRoundedCorners(
                                                border: Border.all(
                                                    color: colorPallet3)),
                                        child: Center(
                                          child: Text(
                                            'مبلغ قابل پرداخت : ${Numeral((event.price * (100 - event.discount)) / 100)} تومان ',
                                            style: boldTextStyle(
                                                color: colorPallet3),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      if (event.price <=
                                          UserProfile.userLogin.wallet)
                                        MaterialButton(
                                          onPressed: () async {
                                            setState(() {
                                              loading = true;
                                            });
                                            bool status =
                                                await addParticipant();
                                            setState(() {
                                              loading = false;
                                            });
                                            if (status) {
                                              UserProfile.userLogin.wallet -=
                                                  event.price;
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration:
                                                boxDecorationWithRoundedCorners(
                                                    backgroundColor:
                                                        colorPallet3),
                                            child: Center(
                                              child: loading
                                                  ? CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ).paddingAll(8)
                                                  : Text(
                                                      getWalletStatus(event),
                                                      style: boldTextStyle(
                                                          color: Colors.white),
                                                    ),
                                            ),
                                          ),
                                        ).paddingSymmetric(horizontal: 15)
                                      else
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth: context.width() * 0.6),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                getWalletStatus(event),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: boldTextStyle(
                                                    color: colorPallet3),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Color(0xffF5F5F5),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.only(top: 20),
                                  child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    children: <Widget>[
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        bank = 0;
                                                      });
                                                    },
                                                    child: ColorFiltered(
                                                      colorFilter: bank != 0
                                                          ? ColorFilter.mode(
                                                              Color(0xffF5F5F5),
                                                              BlendMode.color)
                                                          : ColorFilter.mode(
                                                              Colors
                                                                  .transparent,
                                                              BlendMode.color),
                                                      child: Transform.scale(
                                                        scale: 0.8,
                                                        child: Image(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          image: const AssetImage(
                                                              'assets/images/meli.png'),
                                                          height:
                                                              context.height() *
                                                                  0.4,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        bank = 1;
                                                      });
                                                    },
                                                    child: ColorFiltered(
                                                      colorFilter: bank != 1
                                                          ? ColorFilter.mode(
                                                              Color(0xffF5F5F5),
                                                              BlendMode.color)
                                                          : ColorFilter.mode(
                                                              Colors
                                                                  .transparent,
                                                              BlendMode.color),
                                                      child: Transform.scale(
                                                        scale: 0.7,
                                                        child: Image(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            image: AssetImage(
                                                                'assets/images/mellat.png'),
                                                            height: context
                                                                    .height() *
                                                                0.34,
                                                            fit:
                                                                BoxFit.contain),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        bank = 2;
                                                      });
                                                    },
                                                    child: ColorFiltered(
                                                      colorFilter: bank != 2
                                                          ? ColorFilter.mode(
                                                              Color(0xffF5F5F5),
                                                              BlendMode.color)
                                                          : ColorFilter.mode(
                                                              Colors
                                                                  .transparent,
                                                              BlendMode.color),
                                                      child: Transform.scale(
                                                        scale: 0.8,
                                                        child: Image(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            image: const AssetImage(
                                                                'assets/images/saderat.png'),
                                                            height: context
                                                                    .height() *
                                                                0.4,
                                                            fit:
                                                                BoxFit.contain),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        bank = 3;
                                                      });
                                                    },
                                                    child: ColorFiltered(
                                                      colorFilter: bank != 3
                                                          ? ColorFilter.mode(
                                                              Color(0xffF5F5F5),
                                                              BlendMode.color)
                                                          : ColorFilter.mode(
                                                              Colors
                                                                  .transparent,
                                                              BlendMode.color),
                                                      child: Transform.scale(
                                                        scale: 0.7,
                                                        child: Image(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            image: AssetImage(
                                                                'assets/images/pasargard.png'),
                                                            height: context
                                                                    .height() *
                                                                0.4,
                                                            fit:
                                                                BoxFit.contain),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration:
                                            boxDecorationWithRoundedCorners(
                                                border: Border.all(
                                                    color: colorPallet3)),
                                        child: Center(
                                          child: Text(
                                            'مبلغ قابل پرداخت : ${Numeral((event.price * (100 - event.discount)) / 100)} تومان ',
                                            style: boldTextStyle(
                                                color: colorPallet3),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      MaterialButton(
                                        onPressed: () async {
                                          if (bank != -1 && !loading) {
                                            setState(() {
                                              loading = true;
                                            });
                                            bool status =
                                                await addParticipant();
                                            setState(() {
                                              loading = false;
                                            });
                                            if (status) {}
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration:
                                              boxDecorationWithRoundedCorners(
                                                  backgroundColor:
                                                      colorPallet3),
                                          child: Center(
                                            child: loading
                                                ? CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ).paddingAll(8)
                                                : getBank(bank),
                                          ),
                                        ),
                                      ),

                                      // Image(
                                      //   // width: 20,
                                      //   image: AssetImage(
                                      //       'assets/images/Maskan-logo.jpg'
                                      //   ),
                                      // ),
                                      // ColorFiltered(
                                      //   colorFilter: ColorFilter.mode(
                                      //     Colors.grey,
                                      //     BlendMode.saturation,
                                      //   ),
                                      //   child:
                                      // ),
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
                ),
              ),
            ),
          );
        });
      });
}

getBank(int bank) {
  if (bank == -1) {
    return Text(
      'لطفا بانک مورد نظر را انتخاب کنید.',
      style: boldTextStyle(color: Colors.white, size: 15),
    );
  } else {
    return Text(
      'پرداخت',
      style: boldTextStyle(color: Colors.white),
    );
  }
}
