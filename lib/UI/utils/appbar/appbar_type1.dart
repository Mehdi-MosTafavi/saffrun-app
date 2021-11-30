import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'appbar_base.dart';

class AppBarTitleProfile extends AppBarWidget {
  final String title;
  final BuildContext context;
  final int index;
  final Function functionBack;

  AppBarTitleProfile(this.context, this.index,
      {Key? key, required this.title, required this.functionBack})
      : super(key: key, parentContext: context);

  @override
  Widget getTitleWidget() {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: Theme.of(context).textTheme.headline6!.fontSize! * 0.8),
    );
  }

  @override
  getActions() {
    // TODO: implement getActions
    return [
      const Center(
        child: Text(
          'بازگشت',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ).paddingRight(7),
      InkWell(
        onTap: () {
          Navigator.pop(parentContext);
          functionBack();
        },
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.1),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ).paddingRight(10),
      ),
    ];
  }

  @override
  getLeading() {
    return Container(
      margin: const EdgeInsets.only(left: 13),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/mafia1.jpg',
              ),
              fit: BoxFit.contain)),
    );
  }
}
