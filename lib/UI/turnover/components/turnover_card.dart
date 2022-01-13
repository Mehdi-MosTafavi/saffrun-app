// import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/payment/payment.dart';
import 'package:saffrun_app/models/turnover/turnover_card_model.dart';

import '../../../logical/general/size_function.dart';
import '../../admin/admin_page.dart';
import '../../utils/numeral/Numeral.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

class TurnoverCardWidget extends StatelessWidget {
  TurnoverCardWidget({
    Key? key,
    required this.turnover_card,
  }) : super(key: key);

  DateTime now = DateTime.now();
  final PaymentData turnover_card;
  final String item = 'assets/images/mafia1.jpg';

  int current = 0;
  final CarouselController controller = CarouselController();

  String getStatus(Turnover_card event, DateTime now) {
    switch (event.status) {
      case 1:
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(event.startTime).inDays.round();
          final difference_hour =
              date.difference(event.startTime).inHours.round();
          final difference_minute =
              date.difference(event.startTime).inMinutes.round();
          final difference_second =
              date.difference(event.startTime).inSeconds.round();

          if (difference_day > 0) {
            return difference_day.toString() + " روز";
          } else {
            return (difference_hour - difference_day * 24).toString() +
                ":" +
                (difference_minute - difference_hour * 60).toString() +
                ":" +
                (difference_second - difference_minute * 60).toString();
          }
        }
    // break;

      case 2:
        {
          final date = DateTime.now();
          final difference_day =
              date.difference(event.finishTime).inDays.round();
          final difference_hour =
              date.difference(event.finishTime).inHours.round();
          final difference_minute =
              date.difference(event.finishTime).inMinutes.round();
          final difference_second =
              date.difference(event.finishTime).inSeconds.round();

          if (difference_day > 0) {
            return difference_day.toString() + " روز";
          } else {
            return (difference_hour - difference_day * 24).toString() +
                ":" +
                (difference_minute - difference_hour * 60).toString() +
                ":" +
                (difference_second - difference_minute * 60).toString();
          }
        }
    // break;

      case 3:
        {
          return "-";
        }
    // break;

      default:
        {
          return "";
        }
    // break;
    }
  }

  Color getColor(Turnover_card event) {
    switch (event.status) {
      case 1:
        {
          return Colors.green;
        }
      // break;

      case 2:
        {
          return Colors.yellow;
        }
      // break;

      case 3:
        {
          return Colors.red;
        }
      // break;

      default:
        {
          return Colors.white;
        }
      // break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (turnover_card.event != null) {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => EventPage(event: turnover_card.event!)));
          pushNewScreen(
            context,
            screen: EventPage(
              event: turnover_card.event!,
              heroTag: turnover_card.id,
            ),
            withNavBar: false,
            // OPTIONAL VALUE. True by default.

            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        } else {
          pushNewScreen(
            context,
            screen: AdminPage(
              adminId: turnover_card.reserve!.adminId,
              heroTag: turnover_card.id,
            ),
            withNavBar: false,
            // OPTIONAL VALUE. True by default.

            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        }
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Hero(
                                tag: turnover_card.id,
                                child: CachedNetworkImage(
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
                                  imageUrl: turnover_card.event == null
                                      ? getImageUrlUsers(
                                          turnover_card.reserve!.adminImage)
                                      : getImageUrlUsers(
                                          turnover_card.event!.imageUrls[0]),
                                  fit: BoxFit.fill,
                                  height: context.height() * 0.15,
                                  width: context.width() * 0.3,
                                ),
                              ),
                              // SizedBox(
                              //   width: context.width() * 0.05,
                              // ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: 8,
                                  top: 8,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      turnover_card.event == null
                                          ? turnover_card.reserve!.adminName
                                          : turnover_card.event!.title,
                                      style: boldTextStyle(color: colorPallet3),
                                    ),
                                    4.height,
                                    Text(
                                      turnover_card.type,
                                      style: boldTextStyle(
                                          color: Colors.blueGrey, size: 13),
                                    ),
                                    6.height,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          LineAwesomeIcons.wavy_money_bill,
                                          color: colorPallet2,
                                        ),
                                        3.width,
                                        Text(
                                          '${Numeral(turnover_card.amout)} تومان ',
                                          style: boldTextStyle(
                                              color: colorPallet2),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  3.height,
                                  Text(
                                    getDateForm(turnover_card.date),
                                  ).paddingOnly(left: 5, top: 5),
                                  5.height,
                                ],
                              ).paddingOnly(left: 5, top: 5),
                            ],
                          ),
                        ),

                        // SizedBox(height: 8),

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
