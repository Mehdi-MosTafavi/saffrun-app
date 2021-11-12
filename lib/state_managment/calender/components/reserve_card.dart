import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ReserveCard extends StatelessWidget {
  final Reserve reserve;

  const ReserveCard({Key? key, required this.reserve}) : super(key: key);

  String getStringFormatJalali(Jalali date) {
    var d = date.formatter;
    return date.minute.toString() + ' : ' + date.hour.toString();
  }

  @override
  Widget build(BuildContext context) {
    Jalali startDateJalali = Jalali.fromDateTime(reserve.targetStartReserve);
    Jalali endDateJalali = Jalali.fromDateTime(reserve.targetEndReserve);
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
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
            children: [
              Container(color: colorPallet5, width: 10),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        25.width,
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
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {},
                        child: Text('جزئیات',
                            style:
                                primaryTextStyle(size: 16, color: colorPallet4),
                            maxLines: 2),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
