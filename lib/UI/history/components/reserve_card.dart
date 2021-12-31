// import 'dart:async';

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/UI/admin/admin_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/logical/general/size_function.dart';

import '../../../models/reserve/reserve.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class ReserveCardWidget extends StatefulWidget {
  ReserveCardWidget({
    Key? key,
    required this.reserve,
  }) : super(key: key);

  final Reserve reserve;

  // static const IconData trash = IconData(0xf4c4, fontFamily: iconFont, fontPackage: iconFontPackage);

  @override
  _ReserveCardWidgetState createState() => _ReserveCardWidgetState();
}

class _ReserveCardWidgetState extends State<ReserveCardWidget> {
  final String item = 'assets/images/mafia1.jpg';
  DateTime now = DateTime.now();
  late final Reserve reserve;
  late Timer everySecond;

  @override
  void initState() {
    super.initState();
    reserve = widget.reserve;
    everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    everySecond.cancel();
    super.dispose();
  }

  int current = 0;
  final CarouselController controller = CarouselController();

  String getStatus(Reserve reserve, DateTime now) {
    switch (reserve.status) {
      case "NOT STARTED":
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(reserve.targetStartReserve).inDays.round();
          final difference_hour =
              date.difference(reserve.targetStartReserve).inHours.round();
          final difference_minute =
              date.difference(reserve.targetStartReserve).inMinutes.round();
          final difference_second =
              date.difference(reserve.targetStartReserve).inSeconds.round();
          if (difference_day != 0) {
            return difference_day.abs().toString() + " روز مانده تا شروع ";
            // return (difference_hour - difference_day * 24 - hours).toString() + ":" +
            //     (difference_minute - difference_hour * 60 - minutes).toString() + ":" +
            //     (difference_second - difference_minute * 60 - seconds).toString();
            return (difference_hour - difference_day * 24).abs().toString() +
                ":" +
                (difference_minute - difference_hour * 60).abs().toString() +
                ":" +
                (difference_second - difference_minute * 60).abs().toString();
          } else {
            return (difference_hour - difference_day * 24).abs().toString() +
                ":" +
                (difference_minute - difference_hour * 60).abs().toString() +
                ":" +
                (difference_second - difference_minute * 60).abs().toString();
          }
        }
    // break;

      case "RUNNING":
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(reserve.targetEndReserve).inDays.round();
          final difference_hour =
              date.difference(reserve.targetEndReserve).inHours.round();
          final difference_minute =
              date.difference(reserve.targetEndReserve).inMinutes.round();
          final difference_second =
              date.difference(reserve.targetEndReserve).inSeconds.round();

          if (difference_day > 0) {
            return difference_day.toString() + " روز";
          } else {
            return (difference_hour - difference_day * 24).abs().toString() +
                ":" +
                (difference_minute - difference_hour * 60).abs().toString() +
                ":" +
                (difference_second - difference_minute * 60).abs().toString() +
                " مانده تا اتمام ";
          }
        }
    // break;

      case "FINISHED":
        {
          return "اتمام یافته";
        }
    // break;

      default:
        {
          return "";
        }
    // break;
    }
  }

  Color getColor(Reserve event) {
    switch (event.status) {
      case "NOT STARTED":
        {
          return colorPallet5;
        }
    // break;

      case "RUNNING":
        {
          return Colors.cyan;
        }
    // break;

      case "FINISHED":
        {
          return colorPallet1;
        }
    // break;

      default:
        {
          return colorPallet6;
        }
    // break;
    }
  }

  Color getColorText(Reserve event) {
    switch (event.status) {
      case "NOT STARTED":
        {
          return colorPallet5;
        }
    // break;

      case "RUNNING":
        {
          return colorPallet2;
        }
    // break;

      case "FINISHED":
        {
          return colorPallet1;
        }
    // break;

      default:
        {
          return colorPallet6;
        }
    // break;
    }
  }

  // void _iteration(){
  //   setState(() {
  //       var a=0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Jalali startDateJalali = Jalali.fromDateTime(reserve.targetStartReserve);
    Jalali endDateJalali = Jalali.fromDateTime(reserve.targetEndReserve);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AdminPage(
                    adminId: reserve.adminId,
                  )));
        },
        child: Container(
          // width: context.width() * 0.3,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              boxShadow: defaultBoxShadow(),
              borderRadius: BorderRadius.circular(12)),
          child: IntrinsicHeight(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(color: colorPallet2, width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: context.width() * 0.05),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: imageProvider)),
                                    );
                                  },
                                  placeholder: (context, strImage) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5)),
                                        color: Colors.grey,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    );
                                  },
                                  imageUrl: getImageUrlUsers(
                                      widget.reserve.adminImage),
                                  fit: BoxFit.fill,
                                  height: context.height() * 0.15,
                                  width: context.width() * 0.3,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.reserve.adminName,
                                                style: boldTextStyle(),
                                              ).paddingOnly(top: 15, right: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16, left: 6),
                                                    child: Center(
                                                        child: Icon(
                                                      LineIcons.money_bill,
                                                      color: colorPallet3,
                                                    )),
                                                  ),
                                                  Text(
                                                    widget.reserve.price
                                                        .toString(),
                                                    style: boldTextStyle(),
                                                  ).paddingOnly(
                                                      top: 0, right: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                          Tooltip(
                                            message:
                                                getStatus(widget.reserve, now),
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration:
                                                  boxDecorationWithRoundedCorners(
                                                      boxShape: BoxShape.circle,
                                                      backgroundColor: getColor(
                                                          widget.reserve)),
                                            ).paddingTop(15),
                                          ),
                                        ],
                                      ),
                                      10.height,
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 16, left: 6),
                                            child: Center(
                                                child: Icon(
                                              LineIcons.calendar_1,
                                              color: colorPallet3,
                                            )),
                                          ),
                                          Text(
                                            formatDateReserveString(
                                              widget.reserve.targetStartReserve,
                                            ),
                                            style: boldTextStyle(
                                                color: colorPallet3),
                                          )
                                        ],
                                      ),
                                      FittedBox(
                                        alignment: Alignment.centerRight,
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('زمان نوبت:  ',
                                                style: boldTextStyle(
                                                    color: colorPallet2)),
                                            Text(
                                                getTimeReserve(reserve
                                                        .targetEndReserve) +
                                                    ' - ' +
                                                    getTimeReserve(reserve
                                                        .targetStartReserve),
                                                style: boldTextStyle(
                                                    color: colorPallet2),
                                                maxLines: 2),
                                          ],
                                        ),
                                      ),
                                      10.height,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // 10.height,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getTimeReserve(DateTime time) {
    var minute = '0' + time.minute.toString();
    return time.hour.toString() +
        ':' +
        (minute).substring(minute.length - 2, minute.length);
  }
}

final List<Widget> imageSliders = imgList2
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(item),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
