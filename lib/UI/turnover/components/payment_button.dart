import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
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

void showDialogForPaymentAdd(BuildContext context, Function addParticipant) {
  int bank = -1;
  TextEditingController controller = TextEditingController();
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
              height: context.height() * 0.58,
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Color(0xffF5F5F5),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(top: 20),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                        width: context.width(),
                        height: 40,
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: colorPallet2),
                        child: Center(
                          child: Text(
                            'شارژ کیف پول',
                            style: boldTextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      12.height,
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
                                          ? ColorFilter.mode(Color(0xffF5F5F5),
                                              BlendMode.color)
                                          : ColorFilter.mode(Colors.transparent,
                                              BlendMode.color),
                                      child: Transform.scale(
                                        scale: 0.8,
                                        child: Image(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          image: const AssetImage(
                                              'assets/images/meli.png'),
                                          height: context.height() * 0.4,
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
                                          ? ColorFilter.mode(Color(0xffF5F5F5),
                                              BlendMode.color)
                                          : ColorFilter.mode(Colors.transparent,
                                              BlendMode.color),
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: Image(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            image: AssetImage(
                                                'assets/images/mellat.png'),
                                            height: context.height() * 0.34,
                                            fit: BoxFit.contain),
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
                                          ? ColorFilter.mode(Color(0xffF5F5F5),
                                              BlendMode.color)
                                          : ColorFilter.mode(Colors.transparent,
                                              BlendMode.color),
                                      child: Transform.scale(
                                        scale: 0.8,
                                        child: Image(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            image: const AssetImage(
                                                'assets/images/saderat.png'),
                                            height: context.height() * 0.4,
                                            fit: BoxFit.contain),
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
                                          ? ColorFilter.mode(Color(0xffF5F5F5),
                                              BlendMode.color)
                                          : ColorFilter.mode(Colors.transparent,
                                              BlendMode.color),
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: Image(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            image: AssetImage(
                                                'assets/images/pasargard.png'),
                                            height: context.height() * 0.4,
                                            fit: BoxFit.contain),
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
                        decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(color: colorPallet3)),
                        child: Center(
                          child: TextFormField(
                            cursorHeight: 20,
                            textAlignVertical: TextAlignVertical.center,
                            autofocus: false,
                            cursorColor: const Color(0xffea004e),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: controller,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                alignLabelWithHint: true,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'میزان شارژ',
                                prefixIcon: Icon(
                                  Icons.add_box_rounded,
                                  color: Color(0xff5a5a5a),
                                ),
                                focusColor: Color(0xffea004e),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (bank != -1) {
                            await addParticipant(controller.text.toInt());
                          }
                        },
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        focusElevation: 0.5,
                        child: Container(
                          height: 50,
                          decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: colorPallet3),
                          child: Center(
                            child: getBank(bank, context),
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
              ),
            ),
          );
        });
      });
}

getBank(int bank, BuildContext context) {
  if (bank == -1) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.width() * 0.5),
      child: Text(
        'لطفا بانک مورد نظر را انتخاب کنید.',
        maxLines: 1,
        style: boldTextStyle(color: Colors.white, size: 14),
      ),
    );
  } else {
    return Text(
      'پرداخت و شارژ کیف پول',
      style: boldTextStyle(color: Colors.white),
    );
  }
}
