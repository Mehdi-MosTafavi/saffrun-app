import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/settings/utils/theme.dart';

import '../../constants/theme_color.dart';
import '../utils/appbar/appbar_type1.dart';
import 'components/textfield_edit.dart';

class ProfileSettingEditPage extends StatefulWidget {
  ProfileSettingEditPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingEditPageState createState() => _ProfileSettingEditPageState();
}

class _ProfileSettingEditPageState extends State<ProfileSettingEditPage> {
  String? _selectedLocation = 'مرد';
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = "";
    addressController.text = "";
    contactController.text = "";
    emailController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBarTitleProfile(
        context,
        0,
        title: 'مشخصات پروفایل',
        functionBack: () {},
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // CachedNetworkImage(
            //   placeholder: (context, strImage) {
            //     return Container(
            //       color: Colors.grey,
            //     );
            //   },
            //   imageUrl:
            //       'https://res.cloudinary.com/culturemap-com/image/upload/ar_4:3,c_fill,g_faces:center,w_980/v1519064369/photos/269761_original.jpg',
            //   width: context.width(),
            //   height: context.height() / 2.5,
            //   fit: BoxFit.cover,
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Icon(Icons.camera_alt, size: 16, color: Colors.white),
                        // SizedBox(width: 10),
                        // Text('cover photo',
                        //     style: primaryTextStyle(color: Colors.white)),
                        // SizedBox(width: 20)
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: context.width(),
                      decoration: const BoxDecoration(
                          color: colorPallet3,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 16),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: CachedNetworkImage(
                                            placeholder: (context, strImage) {
                                              return Container(
                                                color: Colors.grey,
                                              );
                                            },
                                            imageUrl:
                                                'https://res.cloudinary.com/culturemap-com/image/upload/ar_4:3,c_fill,g_faces:center,w_980/v1519064369/photos/269761_original.jpg',
                                            width: 80,
                                            height: 80),
                                      ),
                                      SizedBox(width: 24),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('حسین ناصری زاده',
                                                style: boldTextStyle(
                                                    color: white, size: 16)),
                                            SizedBox(height: 8),
                                            Text('hascsdvgedv',
                                                style: primaryTextStyle(
                                                    color: white, size: 16)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        finish(context);
                                      },
                                      child:
                                          Icon(Icons.edit, color: colorPallet3),
                                      backgroundColor: white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: context.width(),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            child: Container(
                              width: context.width(),
                              height: context.height() * 0.86,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('اطلاعات شخصی',
                                      style: primaryTextStyle(size: 18)),
                                  T2EditTextField(
                                    isPassword: false,
                                    mController: nameController,
                                    fontSize: 16.0,
                                  ),
                                  CustomTheme(
                                    child: DropdownButton<String>(
                                      value: _selectedLocation,
                                      items: <String>['زن', 'مرد']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style:
                                                  primaryTextStyle(size: 18)),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedLocation = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                  T2EditTextField(
                                      isPassword: false,
                                      mController: addressController,
                                      maxLine: 2,
                                      fontSize: 16.0),
                                  SizedBox(height: 30),
                                  Text('مخاطب',
                                      style: primaryTextStyle(
                                          color: colorPallet3, size: 18)),
                                  T2EditTextField(
                                      isPassword: false,
                                      mController: contactController,
                                      fontSize: 16.0),
                                  T2EditTextField(
                                      isPassword: false,
                                      mController: emailController,
                                      fontSize: 16.0),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  // IconButton(
                  //   icon: Icon(Icons.arrow_back, color: Colors.black),
                  //   onPressed: () {
                  //     finish(context);
                  //   },
                  // ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                width: context.width(),
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[colorPallet3, colorPallet1]),
                ),
                child: Text('ذخیره اطلاعات',
                    style: primaryTextStyle(size: 18, color: white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
