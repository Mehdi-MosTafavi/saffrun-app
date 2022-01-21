import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/utils/circular_progressbar_component.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/logical/general/size_function.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';
import 'package:saffrun_app/state_managment/home/offer_cubit.dart';

import '../../../models/event/event_model.dart';
import '../../admin/admin_page.dart';
import '../../search/components/event_card.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  late List<Admin> mListings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mListings = [];
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => OfferCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<OfferCubit, OfferState>(
          builder: (context, state) {
            if (state is OfferInitial) {
              BlocProvider.of<OfferCubit>(context).fetchOfferPage();
            }
            if (state is OfferLoad) {
              return Column(
                children: [
                  10.height,
                  Text(
                    'کارفرماهای پیشنهادی',
                    style: boldTextStyle(),
                  ),
                  15.height,
                  state.admins.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.admins.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Admin admin = state.admins[index];
                            return GestureDetector(
                              onTap: () {
                                pushNewScreen(
                                  context,
                              screen: AdminPage(
                                adminId: admin.ownerId,
                                heroTag: admin.ownerId.toString() + 'offer',
                              ),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.

                              pageTransitionAnimation:
                              PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: width * 0.32,
                                  width: width * 0.32,
                                  child: Stack(
                                    children: <Widget>[
                                      Hero(
                                        tag: admin.ownerId.toString() + 'offer',
                                        child: ClipRRect(
                                          borderRadius:
                                          new BorderRadius.circular(12.0),
                                          child: CachedNetworkImage(
                                            placeholder: (context, strImage) {
                                              return Container(
                                                color: Colors.grey,
                                              );
                                            },
                                            imageUrl: getImageUrlUsers(
                                                admin.imageUrls[0]),
                                            fit: BoxFit.fill,
                                            height: width * 0.32,
                                            width: width * 0.32,
                                          ),
                                        ),
                                      ),
                                      // Align(
                                      //   alignment: Alignment.topRight,
                                      //   child: Container(
                                      //     margin: const EdgeInsets.only(right: 10, top: 10),
                                      //     child: const Icon(Icons.favorite_border,
                                      //         color: Colors.red, size: 20),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                          text(admin.title,
                                              textColor: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          text(admin.description,
                                              maxLine: 1,
                                              textColor: Colors.grey,
                                              fontSize: 13),
                                          6.height,
                                          Row(
                                            children: <Widget>[
                                              // RatingBar(
                                              //   initialRating: 5,
                                              //   minRating: 1,
                                              //   itemSize: 16,
                                              //   direction: Axis.horizontal,
                                              //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                              //   ratingWidget: RatingWidget(half: null, full: null),
                                              //       (context, _) => Icon(
                                              //     Icons.star,
                                          //     color: t7colorPrimary,
                                          //   ),
                                          //   onRatingUpdate: (rating) {},
                                          // ),
                                          text(admin.category,
                                              textColor: Colors.blueGrey,
                                              fontSize: 13),
                                        ],
                                      ),
                                      5.height,
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration:
                                        boxDecorationWithRoundedCorners(
                                            backgroundColor: colorPallet1,
                                            borderRadius: BorderRadius.circular(
                                                10)),
                                        child: FittedBox(
                                          child: Row(
                                            children: [
                                              text('تعداد دنبال کننده ها: ',
                                                  textColor: Colors.white,
                                                  fontSize: 13),
                                              text(
                                                  admin.followerCount
                                                      .toString(),
                                                  fontWeight: FontWeight.bold,
                                                  textColor: Colors.white,
                                                  fontSize: 13),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // text(mListings[index].getRate(),
                                      //     maxLine: 1,
                                      //     isLongText: true,
                                      //     textColor: Colors.black,
                                          //     fontSize: 13),
                                          const SizedBox(height: 8),
                                          // const Divider(height: 0.5, color: Colors.black, thickness: 1)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Center(
                            child: Text(
                              'هیچ کارفرمای پیشنهادی برای شما وجود ندارد',
                              style: primaryTextStyle(),
                            ),
                          ),
                        ),
                  20.height,
                  Text(
                    'رویدادهای پیشنهادی',
                    style: boldTextStyle(),
                  ),
                  15.height,
                  state.events.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.events.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Event admin = state.events[index];
                            return EventCardWidget(
                              event: admin,
                            );
                          })
                      : Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Center(
                            child: Text(
                              'هیچ رویداد پیشنهادی برای شما وجود ندارد',
                              style: primaryTextStyle(),
                            ),
                          ),
                        ),
                ],
              );
            }
            return const Center(
              child: CircularProgressBar(),
            );
          },
        ),
      ),
    );
  }
}

Widget text(String? text,
    {double fontSize = 15,
    Color? textColor,
    var fontFamily,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5,
    bool textAllCaps = false,
    var isLongText = false,
    bool lineThrough = false,
    FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor ?? Colors.white,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}
