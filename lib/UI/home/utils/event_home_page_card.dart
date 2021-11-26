import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/event/event_model.dart';

class EventHomePageCard extends StatelessWidget {
  const EventHomePageCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, bottom: 5, top: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      // decoration: BoxDecoration(
      //     // boxShadow: defaultBoxShadow(),
      //     borderRadius: BorderRadius.circular(12)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(color: colorPallet2, width: 10),
            const SizedBox(width: 10),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // CachedNetworkImage(
                        //   placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        //   imageUrl: mFavouriteList[index].image,
                        //   width: width / 5,
                        //   height: 100,
                        // ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(event.title,
                                        style:
                                            boldTextStyle(color: Colors.black),
                                        maxLines: 2),
                                    Text("کافه رخ",
                                        style: primaryTextStyle(
                                            weight: FontWeight.w500,
                                            color: colorPallet5),
                                        maxLines: 2),
                                  ],
                                ),
                                Text(event.description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: primaryTextStyle(
                                        size: 16, color: Colors.blueGrey)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
