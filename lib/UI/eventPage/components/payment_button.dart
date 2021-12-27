import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:saffrun_app/UI/history/components/event_card.dart';

// import 'package:saffrun_app/UI/admin/components/event_card.dart';
// import 'package:saffrun_app/UI/history/components/reserve_card.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';
import 'package:saffrun_app/constants/theme_color.dart';
// import 'package:saffrun_app/models/history/event_model.dart';
// import 'package:saffrun_app/models/history/reserve_model.dart';

void showDialogForPayment(BuildContext context) {

  int bank = -1;
  String wallet_status_text = 'شارژ کیف پول';
  // ColorFiltered maskan_logo = ColorFiltered(
  //     colorFilter: bank != 0
  //         ? ColorFilter.mode(Color(0xffF5F5F5), BlendMode.color)
  //         : ColorFilter.mode(Colors.transparent, BlendMode.color),
  //     child: Image(
  //     width: MediaQuery.of(context)
  //         .size
  //         .width,
  //     image: const AssetImage(
  //         'assets/images/Maskan-logo.jpg'),
  //     height:
  //     context.height() * 0.4,
  //     fit: BoxFit.cover),);
  //
  // void change_status(int bank, ColorFiltered maskan_logo) {
  //   bank=0;
  //   setState(){
  //
  //     maskan_logo = ColorFiltered(
  //       colorFilter: bank != 0
  //           ? ColorFilter.mode(Color(0xffF5F5F5), BlendMode.color)
  //           : ColorFilter.mode(Colors.transparent, BlendMode.color),
  //       child: Image(
  //           width: MediaQuery.of(context)
  //               .size
  //               .width,
  //           image: const AssetImage(
  //               'assets/images/Maskan-logo.jpg'),
  //           height:
  //           context.height() * 0.4,
  //           fit: BoxFit.cover,
  //       color: Colors.grey,),
  //     );
  //   }
  // }

  showDialog(
      context: context,
      // useSafeArea: false,
      // useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            // contentPadding: const EdgeInsets.all(0.0),
            content: DefaultTabController(
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
                              child: ListView(
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          image: AssetImage(
                                              'assets/images/wallet.jpg'),
                                          height: context.height() * 0.4,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: colorPallet3),
                                    child: Center(
                                      child: Text(
                                        '10000',
                                        style:
                                            boldTextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: colorPallet3),
                                      child: Center(
                                        child: Text(
                                          wallet_status_text,
                                          style: boldTextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: ListView(
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
                                              InkWell(
                                                onTap: (){
                                                  setState((){
                                                    bank=0;
                                                  });
                                                },
                                                child: ColorFiltered(
                                                  colorFilter: bank != 0
                                                      ? ColorFilter.mode(Color(0xffF5F5F5), BlendMode.color)
                                                      : ColorFilter.mode(Colors.transparent, BlendMode.color),
                                                  child: Image(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    image: const AssetImage(
                                                        'assets/images/Maskan-logo.jpg'),
                                                    height:
                                                    context.height() * 0.4,
                                                    fit: BoxFit.cover,
                                                    ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  setState((){
                                                    bank=1;
                                                  });
                                                },
                                                child: ColorFiltered(
                                                  colorFilter: bank != 1
                                                      ? ColorFilter.mode(Color(0xffF5F5F5), BlendMode.color)
                                                      : ColorFilter.mode(Colors.transparent, BlendMode.color),
                                                  child: Image(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      image: AssetImage(
                                                          'assets/images/Mellat-logo.jpg'),
                                                      height:
                                                          context.height() * 0.4,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  setState((){
                                                    bank=2;
                                                  });
                                                },
                                                child: ColorFiltered(
                                                  colorFilter: bank != 2
                                                      ? ColorFilter.mode(Color(0xffF5F5F5), BlendMode.color)
                                                      : ColorFilter.mode(Colors.transparent, BlendMode.color),
                                                  child: Image(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      image: const AssetImage(
                                                          'assets/images/Saderat-logo.jpg'),
                                                      height:
                                                          context.height() * 0.4,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  setState((){
                                                    bank=3;
                                                  });
                                                },
                                                child: ColorFiltered(
                                                  colorFilter: bank != 3
                                                      ? ColorFilter.mode(Color(0xffF5F5F5), BlendMode.color)
                                                      : ColorFilter.mode(Colors.transparent, BlendMode.color),
                                                  child: Image(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      image: AssetImage(
                                                          'assets/images/Tejarat-logo.jpg'),
                                                      height:
                                                          context.height() * 0.4,
                                                      fit: BoxFit.cover),
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
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: colorPallet3),
                                    child: Center(
                                      child: Text(
                                        '10000',
                                        style: boldTextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    onPressed: (){},
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: boxDecorationWithRoundedCorners(
                                          backgroundColor: colorPallet3),
                                      child: Center(
                                        child: getBank(bank),
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
          );
        });
      });
}



getBank(int bank) {
  if(bank==-1)
    {
      return Text(
        'لطفا بانک مورد نظر را انتخاب کنید.',
        style: boldTextStyle(color: Colors.white,size: 10),
      );
    }
  else
    {
      return Text(
        'پرداخت',
        style: boldTextStyle(color: Colors.white),
      );
    }
}
