import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/history/history_page.dart';
import 'package:saffrun_app/UI/settings/profile_edit_setting.dart';
import 'package:saffrun_app/UI/turnover/turn_over.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/user/user_2.dart';

import '../../logical/general/size_function.dart';
import '../utils/show_dialog.dart';
import 'components/profile_list_item.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({Key? key}) : super(key: key);

  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  Widget build(BuildContext context) {
    double coverHeight = context.height() * 0.27;
    double profileHeight = context.height() * 0.2;
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Scaffold(
        body: Column(
      // padding: EdgeInsets.symmetric(vertical: context.height() * 0.025,
      //                               horizontal: context.width() * 0.05),
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: bottom),
                child: buildCoverImage(coverHeight)),
            Positioned(
              right: 50,
              top: top,
              child: buildProfileImage(profileHeight),
            ),
            Positioned(
              left: context.width() * 0.072,
              bottom: 10,
              child: Container(
                width: context.width() * 0.42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width() * 0.42,
                      child: Row(
                        children: [
                          SizedBox(
                            width: context.width() * 0.42,
                            child: Text(
                              UserProfile.userLogin.getFullName(),
                              style:
                                  boldTextStyle(color: colorPallet3, size: 19),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "نام کاربری: ",
                          style:
                              primaryTextStyle(color: colorPallet3, size: 15),
                        ),
                        SizedBox(
                          width: context.width() * 0.23,
                          child: Text(
                            UserProfile.userLogin.username,
                            style:
                                primaryTextStyle(color: colorPallet3, size: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.height() * 0.008,
              horizontal: context.width() * 0.05),
          child: ProfileListItems(
            changeState: () {
              print('1');
              setState(() {});
            },
          ),
        ),
      ],
    ));
  }

  Widget buildCoverImage(double coverHeight) => Container(
        color: colorPallet2,
        height: coverHeight,
      );

  Widget buildProfileImage(double profileHeight) {
    print('doroste');
    return Container(
      width: profileHeight,
      height: profileHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
      ),
      child: CachedNetworkImage(
        placeholder: (context, strImage) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
                color: Colors.grey.withOpacity(0.85),
              ),
            );
          },
          imageUrl: getImageUrl(),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
                image:
                    DecorationImage(fit: BoxFit.cover, image: imageProvider)),
          );
        },
      ),
    );
  }
}

class ProfileListItems extends StatefulWidget {
  Function changeState;

  ProfileListItems({Key? key, required this.changeState}) : super(key: key);

  @override
  State<ProfileListItems> createState() => _ProfileListItemsState();
}

class _ProfileListItemsState extends State<ProfileListItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: context.height() * 0.032),
        ProfileListItem(
          icon: LineAwesomeIcons.user_edit,
          // icon: Icons.home,
          text: 'اطلاعات پروفایل',
          onTapRow: () {
            pushNewScreen(
              context,
              screen: ProfileSettingEditPage(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            ).then((value) {
              print('2');
              widget.changeState();
            });
          },
        ),
        15.height,
        const Divider(
          color: Color(0xffEFF0F6),
          thickness: 4,
        ),
        15.height,
        ProfileListItem(
          icon: LineAwesomeIcons.history,
          text: 'تاریخچه',
          onTapRow: () {
            pushNewScreen(
              context,
              screen: const HistoryPage(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
        15.height,
        const Divider(
          color: Color(0xffEFF0F6),
          thickness: 4,
        ),
        15.height,
        ProfileListItem(
          icon: LineAwesomeIcons.money_bill,
          text: 'گردش مالی',
          onTapRow: () {
            pushNewScreen(
              context,
              screen: const TurnOver(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
        15.height,
        const Divider(
          color: Color(0xffEFF0F6),
          thickness: 4,
        ),
        15.height,
        ProfileListItem(
          icon: LineAwesomeIcons.alternate_sign_out,
          text: 'خروج',
          hasNavigation: false,
          onTapRow: () {
            showMessage(context, 'خروج', 'آیا از خروج از برنامه اطمینان دارد؟',
                functionRun: () async {
              final _prefs = await SharedPreferences.getInstance();
              await _prefs.clear();
                  print('1');
                  Phoenix.rebirth(context);
                });
          },
        ),
      ],
    );
  }
}
