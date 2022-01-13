import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/admin/admin_page.dart';
import 'package:saffrun_app/logical/general/size_function.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ReserveHomePageCard extends StatelessWidget {
  final Reserve reserve;
  final Function onTapCard;

  const ReserveHomePageCard({Key? key, required this.reserve, required this.onTapCard})
      : super(key: key);

  String getStringFormatJalali(Jalali date) {
    var d = date.formatter;
    return date.minute.toString() + ' : ' + date.hour.toString();
  }

  @override
  Widget build(BuildContext context) {
    Jalali startDateJalali = Jalali.fromDateTime(reserve.targetStartReserve);
    Jalali endDateJalali = Jalali.fromDateTime(reserve.targetEndReserve);
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, bottom: 0),
      // decoration: BoxDecoration(
      //     boxShadow: defaultBoxShadow(),
      //     borderRadius: BorderRadius.circular(12)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(color: Colors.transparent, width: 5),
            const SizedBox(width: 0),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Column(
                        children: <Widget>[
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: CachedNetworkImage(
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: imageProvider)),
                                      );
                                    },
                                    placeholder: (context, strImage) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                      );
                                    },
                                    imageUrl:
                                        getImageUrlUsers(reserve.adminImage),
                                    fit: BoxFit.cover,
                                    height: context.height() * 0.11,
                                    width: context.width() * 0.2,
                                  ).paddingAll(8)),
                              Expanded(
                                flex: 6,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(reserve.adminName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: boldTextStyle(
                                                  size: 16,
                                                  color: Colors.black)),
                                        ),
                                        5.height,
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                              getStringFormatJalali(
                                                  endDateJalali) +
                                                  ' - ' +
                                                  getStringFormatJalali(
                                                      startDateJalali),
                                              style: primaryTextStyle(
                                                  color: Colors.blueGrey),
                                              maxLines: 2),
                                        ).paddingRight(15)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              pushNewScreen(
                                context,
                                screen: AdminPage(
                                  adminId: reserve.adminId,
                                ),
                                withNavBar: false,
                                // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
