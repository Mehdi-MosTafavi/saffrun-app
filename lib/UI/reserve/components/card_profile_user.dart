import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/const.dart';

import '../../../models/admin/admin_model.dart';

class CardProfileReserveWidget extends StatelessWidget {
  Admin admin;

  CardProfileReserveWidget({Key? key, required this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            height: 120,
            decoration:
            boxDecorationWithRoundedCorners(backgroundColor: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: imageProvider)),
                          );
                        },
                        placeholder: (context, strImage) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          );
                        },
                        imageUrl: admin.imageUrls.isEmpty
                            ? DefaultImage
                            : admin.imageUrls[0],
                        fit: BoxFit.cover,
                        height: context.height() * 0.1,
                        width: context.width() * 0.2,
                      ).paddingAll(8),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          admin.title,
                          style: boldTextStyle(),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.category,
                              color: Colors.black,
                            ),
                            5.width,
                            Text(
                              admin.category,
                              style: secondaryTextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
