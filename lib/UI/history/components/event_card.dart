// import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';

import '../../../constants/const.dart';
import '../../../logical/general/size_function.dart';
import '../../../models/event/event_model.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class EventCardWidget extends StatefulWidget {
  final int index;

  EventCardWidget({
    Key? key,
    required this.event,
    required this.index,
  }) : super(key: key);
  final Event event;

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime now = DateTime.now();

  final String item = 'assets/images/mafia1.jpg';

  int current = 0;

  final CarouselController controller = CarouselController();

  String getStatus(Event event, DateTime now) {
    switch (event.status) {
      case "NOT STARTED":
        {
          return 'شروع نشده';
          final date = DateTime.now();
          final difference_day =
          date.difference(event.startTime).inDays.round();
          final difference_hour =
          date.difference(event.startTime).inHours.round();
          final difference_minute =
          date.difference(event.startTime).inMinutes.round();
          final difference_second =
          date.difference(event.startTime).inSeconds.round();

          if (difference_day != 0) {
            return difference_day.abs().toString() + " روز تا شروع ";
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
          return 'در حال برگزاری';
          final date = DateTime.now();
          final difference_day =
          date.difference(event.finishTime).inDays.round();
          final difference_hour =
          date.difference(event.finishTime).inHours.round();
          final difference_minute =
          date.difference(event.finishTime).inMinutes.round();
          final difference_second =
          date.difference(event.finishTime).inSeconds.round();

          if (difference_day != 0) {
            return difference_day.abs().toString() + " روز مانده تا اتمام";
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

  Color getColor(Event event) {
    switch (event.status) {
      case "NOT STARTED":
        {
          return colorPallet5;
        }
    // break;

      case "RUNNING":
        {
          return Colors.green;
        }
    // break;

      case "FINISHED":
        {
          return Colors.blueGrey;
        }
      // break;

      default:
        {
          return colorPallet6;
        }
      // break;
    }
  }

  Color getColorText(Event event) {
    switch (event.status) {
      case "NOT STARTED":
        {
          return colorPallet5;
        }
      // break;

      case "RUNNING":
        {
          return Colors.green;
        }
      // break;

      case "FINISHED":
        {
          return Colors.blueGrey;
        }
      // break;

      default:
        {
          return colorPallet6;
        }
      // break;
    }
  }

  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    // Timer timer = Timer.periodic(Duration(seconds: 1), (Timer t) => buildCountWidget());
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: EventPage(
              event: widget.event,
              heroTag: widget.event.id.toString() + widget.toString()),
          withNavBar: false,
          // OPTIONAL VALUE. True by default.

          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
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
                                Hero(
                                  tag: widget.event.id.toString() +
                                      widget.toString(),
                                  child: CachedNetworkImage(
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8)),
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
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
                                    imageUrl: widget.event.imageUrls.isNotEmpty
                                        ? getImageUrlUsers(
                                            widget.event.imageUrls[0])
                                        : DefaultImage,
                                    fit: BoxFit.fill,
                                    height: context.height() * 0.18,
                                    width: context.width() * 0.3,
                                  ),
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
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        context.width() * 0.38),
                                                child: Text(
                                                  widget.event.title,
                                                  style: boldTextStyle(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ).paddingOnly(
                                                    top: 15, right: 10),
                                              ),
                                              5.height,
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
                                                      LineIcons.users,
                                                      color: colorPallet3,
                                                    )),
                                                  ),
                                                  Container(
                                                    child: Center(
                                                      child: Text(
                                                        widget.event
                                                            .participantCount
                                                            .toString(),
                                                        style: boldTextStyle(
                                                          color: colorPallet3,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showStatus = !showStatus;
                                              });
                                            },
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              height: showStatus ? 35 : 28,
                                              width: showStatus
                                                  ? context.width() * 0.16
                                                  : 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: showStatus
                                                      ? BorderRadius.circular(
                                                          12)
                                                      : BorderRadius.circular(
                                                          18),
                                                  color:
                                                      getColor(widget.event)),
                                              child: showStatus
                                                  ? Center(
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          getStatus(
                                                              widget.event,
                                                              now),
                                                          style:
                                                              secondaryTextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ).paddingAll(3)
                                                  : Center(
                                                      child: Icon(
                                                      LineIcons.info,
                                                      size: 20,
                                                    )),
                                            ).paddingTop(15),
                                          ),
                                        ],
                                      ),
                                      10.height,
                                      FittedBox(
                                        alignment: Alignment.centerRight,
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Wrap(
                                                  // alignment: WrapAlignment.start,
                                                  direction: Axis.vertical,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          LineIcons.user_clock,
                                                          color: colorPallet3,
                                                        ),
                                                        3.width,
                                                        Text(
                                                          formatTimeString(
                                                              widget.event
                                                                  .startTime),
                                                          style:
                                                              boldTextStyle(),
                                                        ),
                                                      ],
                                                    ).paddingSymmetric(
                                                        horizontal: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          LineIcons.user_clock,
                                                          color: colorPallet3,
                                                        ),
                                                        3.width,
                                                        Text(
                                                          formatTimeString(
                                                              widget.event
                                                                  .finishTime),
                                                          style:
                                                              boldTextStyle(),
                                                        ),
                                                      ],
                                                    ).paddingSymmetric(
                                                        horizontal: 10),
                                                  ],
                                                ),
                                              ],
                                            ),
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
}
