import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/eventPage/event_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
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
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(item))),
                      ),
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
                                      Text(event.title,
                                          style: boldTextStyle(
                                              color: Colors.black),
                                          maxLines: 2),
                                      Text("کافه رخ",
                                          style: primaryTextStyle(
                                              weight: FontWeight.w500,
                                              size: 15,
                                              color: colorPallet5),
                                          maxLines: 2),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.supervised_user_circle_sharp,
                                        size: 20,
                                        color: colorPallet3,
                                      ),
                                      3.width,
                                      Text(
                                        "سرگرمی",
                                        style: boldTextStyle(
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
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EventPage()));
                      },
                      child: Text('جزئیات',
                          style:
                              primaryTextStyle(size: 15, color: colorPallet4),
                          maxLines: 2),
                    ),
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
