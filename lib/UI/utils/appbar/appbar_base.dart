import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final BuildContext parentContext;
  final bool extend;

  const AppBarWidget(
      {Key? key, required this.parentContext, this.extend = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        toolbarHeight: height * 0.1,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: getTitleWidget(),
        centerTitle: true,
        // excludeHeaderSemantics: true,
        backgroundColor: Colors.transparent,
        // backgroundColor: Color(0xffd0dee9),
        leading: getLeading(),
        actions: getActions(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(parentContext).size.height * 0.066);

  List<Widget>? getActions();

  Widget? getLeading();

  Widget getTitleWidget();
}
