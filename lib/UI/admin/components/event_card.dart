import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/logical/general/size_function.dart';
import 'package:saffrun_app/models/event/event_model.dart';

final List<String> imgList2 = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];


class EventCardWidget extends StatelessWidget {
  EventCardWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;
  final String item='assets/images/mafia1.jpg';


  int current = 0;
  final CarouselController controller = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
              // const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: <Widget>[
                    // CachedNetworkImage(
                    //   placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    //   imageUrl: mFavouriteList[index].image,
                    //   width: width / 5,
                    //   height: 100,
                    // ),
                    Expanded(
                      flex: 2,
                      child: Hero(
                          tag: event.id.toString() + "profile",
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
                            imageUrl: getImageUrlUsers(event.imageUrls[0]),
                            fit: BoxFit.fill,
                            height: context.height() * 0.15,
                            width: context.width(),
                          )),
                    ),
                    // const SizedBox(width: 10,height: 10,),

                    // Container(
                    // height: context.height(),
                    // width: context.width(),
                    // decoration: const BoxDecoration(color: colorPallet5),
                    // child: Stack(
                    //   children: [
                    //     CarouselSlider(
                    //       items: imageSliders,
                    //       carouselController: controller,
                    //       options: CarouselOptions(
                    //           autoPlay: true,
                    //           enlargeCenterPage: true,
                    //           aspectRatio: 2.0,
                    //           ),
                    //     ),
                    //     ],
                    // ),
                    // ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 4, top: 11),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: context.width() * 0.28,
                                        child: Text(
                                          event.title,
                                          style: boldTextStyle(
                                              color: colorPallet2),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text("کافه رخ",
                                          style: boldTextStyle(
                                              // weight: FontWeight.w500,
                                              size: 13,
                                              color: colorPallet5),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                  5.height,
                                  Row(
                                    children: [
                                      8.width,
                                      const Icon(
                                        Icons.supervised_user_circle_sharp,
                                        size: 20,
                                        color: colorPallet5,
                                      ),
                                      3.width,
                                      Text(
                                        "سرگرمی",
                                        style: primaryTextStyle(
                                            size: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .fontSize!
                                                .toInt(),
                                            color: colorPallet5),
                                      ),
                                    ],
                                  ),
                                  // Text(event.description,
                                  //     style: primaryTextStyle(
                                  //         size: 10, color: Colors.blueGrey)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 10),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EventPage(
                              event: event,
                                  heroTag: event.id.toString() + "profile",
                                )));
                      },
                      child: Text('جزئیات',
                          style:
                          primaryTextStyle(size: 15, color: colorPallet4),
                          maxLines: 2),
                    ),
                    10.height,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
