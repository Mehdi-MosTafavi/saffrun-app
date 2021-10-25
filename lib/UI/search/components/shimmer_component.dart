import 'package:flutter/material.dart';
import 'package:saffrun_app/UI/utils/shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.grey[100],
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 10),
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 10,
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.grey,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 50,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
