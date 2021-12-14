import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
import 'package:saffrun_app/constants/theme_color.dart';
// import '../constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final Function onTapRow;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTapRow,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kTitleTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    final double height = context.height();
    final double width = context.width();
    return Container(
      // height: height * 0.08,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.005,
      ).copyWith(
        bottom: 0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.025,
      ),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(30),
          ),
      child: InkWell(
        onTap: () {
          onTapRow();
        },
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Icon(
                  this.icon,
                  size: 25,
                  color: colorPallet4,
                ),
                SizedBox(width: width * 0.02),
                Text(
                  this.text,
                  style: kTitleTextStyle.copyWith(
                      fontWeight: FontWeight.w800, color: colorPallet4
                      // fontFamily: "Poppins"
                      ),
                ),
                Spacer(),
                if (this.hasNavigation)
                  IconButton(
                    splashRadius: 10,
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: colorPallet4,
                      size: 20,
                    ),
                    onPressed: () {
                      // setState(() {
                      //   _volume += 10;
                      // });
                    },
                  ),
              ],
            ),
            if (this.hasNavigation)
              Divider(
                height: 10,
                color: Colors.black.withOpacity(0.1),
                thickness: 1,
              )
          ],
        ),
      ),
    );
  }
}