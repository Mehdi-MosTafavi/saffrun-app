import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CardProfileReserveWidget extends StatelessWidget {
  const CardProfileReserveWidget({
    Key? key,
  }) : super(key: key);

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
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
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
                          'مهندس هلاکویی',
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
                              'مهندس ساختمان',
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
