import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';

import 'components/nearest_event_reserve_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPos = 1;

  double spacing_standard_new = 16.0;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: selectedPos == 2
            ? Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    // Image.asset(social_fab_edit, width: width * 0.2, height: width * 0.2),
                    // Image.asset(social_fab_msg, width: width * 0.2, height: width * 0.2),
                  ],
                ),
              )
            : Container(
                width: width * 0.2,
                height: width * 0.2,
                alignment: Alignment.bottomRight,
                child: Container(),
              ),
        backgroundColor: Colors.white,
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // mToolbar(context, social_lbl_dashboard, social_ic_setting, onTap: () {
            //   SocialSetting().launch(context);
            // }),
            SizedBox(
              height: context.height() * 0.07,
            ),
            SizedBox(height: spacing_standard_new),
            Container(
              width: width,
              height: 55,
              decoration: boxDecorationDefault(
                  boxShadow: defaultBoxShadow(shadowColor: shadowColorGlobal)),
              margin: EdgeInsets.only(
                  right: spacing_standard_new, left: spacing_standard_new),
              child: Row(
                children: <Widget>[
                  // Flexible(
                  //   child: InkWell(
                  //     onTap: () {
                  //       selectedPos = 1;
                  //       setState(() {});
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(10.0),
                  //       width: width,
                  //       child: Container(),
                  //       // child: text(
                  //       //   social_lbl_chats,
                  //       //   fontFamily: fontMedium,
                  //       //   isCentered: true,
                  //       //   textColor: selectedPos == 1 ? social_textColorPrimary : social_textColorSecondary,
                  //       // ),
                  //     ),
                  //   ),
                  //   flex: 1,
                  // ),
                  // Container(
                  //     width: 1, height: width * 0.1, color: Colors.black),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        selectedPos = 1;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: width,
                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            child: Text(
                              'نزدیک ترین',
                              style: boldTextStyle(
                                  color: selectedPos == 1
                                      ? colorPallet2
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Container(width: 1, height: width * 0.1, color: Colors.black),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedPos = 2;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: width,
                        child: Center(
                          child: Text(
                            'پیشنهاد ها',
                            style: boldTextStyle(
                                color: selectedPos == 2
                                    ? colorPallet2
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            if (selectedPos == 1) const NearestEventReservePage(),
            // if (selectedPos == 2) SocialHomeStatus(),
            // if (selectedPos == 3) SocialHomeCalls()
          ],
        ));
  }
}
