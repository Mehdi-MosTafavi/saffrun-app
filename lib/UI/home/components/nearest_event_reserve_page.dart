import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NearestEventReservePage extends StatefulWidget {
  const NearestEventReservePage({Key? key}) : super(key: key);

  @override
  _NearestEventReservePageState createState() =>
      _NearestEventReservePageState();
}

class _NearestEventReservePageState extends State<NearestEventReservePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: context.width(),
      decoration: const BoxDecoration(
          // color: Colors.red
          ),
      child: Column(
        children: [
          24.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'نوبت های نزدیک',
              style:
                  boldTextStyle(textDecorationStyle: TextDecorationStyle.solid),
            ).paddingAll(12),
          ),
          10.height,
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [ListTile()],
            ),
          )
        ],
      ),
    );
  }
}
