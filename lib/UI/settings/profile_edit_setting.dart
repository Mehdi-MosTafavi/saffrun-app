import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/state_managment/settings/setting_cubit.dart';

import '../../constants/theme_color.dart';
import '../utils/appbar/appbar_type1.dart';
import '../utils/picker/image_picker.dart';
import 'components/textfield_edit.dart';

class ProfileSettingEditPage extends StatefulWidget {
  ProfileSettingEditPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingEditPageState createState() => _ProfileSettingEditPageState();
}

class _ProfileSettingEditPageState extends State<ProfileSettingEditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late String gender;
  late File image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gender = "male";
    nameController.text = "";
    addressController.text = "";
    contactController.text = "";
    emailController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // extendBody: true,
        appBar: AppBarTitleProfileSaffronColor(
          context,
          0,
          title: 'مشخصات پروفایل',
          functionBack: () {},
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: context.width(),
                        decoration: const BoxDecoration(
                          color: colorPallet2,
                        ),
                        child: BlocBuilder<SettingCubit, SettingState>(
                          builder: (context, state) {
                            print(state);
                            return Column(
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
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: state
                                                      is SettingEnterValidValue
                                                  ? Container(
                                                      child: Image.file(
                                                        (state.file),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      width: 80,
                                                      height: 80,
                                                    )
                                                  : GestureDetector(
                                                      onTap: () async {
                                                        print(state);
                                                        if (state
                                                            is SettingInitial) {
                                                          BlocProvider.of<
                                                                      SettingCubit>(
                                                                  context)
                                                              .selectImage(
                                                                  await getImage(
                                                                      context));
                                                        }
                                                        if (state
                                                            is SettingEnterValidValue) {
                                                          BlocProvider.of<
                                                                      SettingCubit>(
                                                                  context)
                                                              .emit(
                                                                  SettingInitial());
                                                        }
                                                      },
                                                      child: CachedNetworkImage(
                                                          placeholder: (context,
                                                              strImage) {
                                                            return Container(
                                                              color:
                                                                  Colors.grey,
                                                            );
                                                          },
                                                          imageUrl:
                                                              'https://res.cloudinary.com/culturemap-com/image/upload/ar_4:3,c_fill,g_faces:center,w_980/v1519064369/photos/269761_original.jpg',
                                                          width: 80,
                                                          imageBuilder: (context,
                                                              imageProvider) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                  color: Colors
                                                                      .white,
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image:
                                                                          imageProvider)),
                                                            );
                                                          },
                                                          height: 80),
                                                    ),
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
                                                          color: white,
                                                          size: 19)),
                                                  SizedBox(height: 8),
                                                  Text('hoseeein',
                                                      style: primaryTextStyle(
                                                          color: white,
                                                          size: 17)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            print(state);
                                            if (state is SettingInitial) {
                                              BlocProvider.of<SettingCubit>(
                                                      context)
                                                  .selectImage(
                                                      await getImage(context));
                                            }
                                            if (state
                                                is SettingEnterValidValue) {
                                              BlocProvider.of<SettingCubit>(
                                                      context)
                                                  .emit(SettingInitial());
                                            }
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: white,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                                (state is SettingInitial)
                                                    ? Icons.edit
                                                    : Icons.delete,
                                                color: colorPallet2),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: context.width(),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24))),
                                  child: Container(
                                    width: context.width(),
                                    height: context.height() * 0.8,
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('نام و نام خانوادگی',
                                            style: boldTextStyle(
                                                color: colorPallet3)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  colorPallet2.withOpacity(0.2),
                                              child: const Icon(
                                                LineAwesomeIcons.user_1,
                                                color: colorPallet2,
                                                size: 30,
                                              ),
                                            ).paddingTop(10),
                                            5.width,
                                            Expanded(
                                              child: T2EditTextField(
                                                isPassword: false,
                                                mController: nameController,
                                                fontSize: 16.0,
                                              ).paddingLeft(50),
                                            ),
                                          ],
                                        ),
                                        15.height,
                                        Row(
                                          children: [
                                            Text('جنسیت : ',
                                                style: boldTextStyle(
                                                    color: colorPallet3)),
                                            Theme(
                                              data: Theme.of(context).copyWith(
                                                  unselectedWidgetColor:
                                                      colorPallet5),
                                              child: Radio(
                                                value: 'male',
                                                groupValue: gender,
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        colorPallet2),
                                                onChanged: (dynamic value) {
                                                  setState(() {
                                                    gender = value;
                                                    // toast("$sortField Selected");
                                                  });
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text('مرد',
                                                    style: primaryTextStyle()),
                                                Icon(
                                                  Icons.male_rounded,
                                                  color: colorPallet3,
                                                )
                                              ],
                                            ),
                                            Theme(
                                              data: Theme.of(context).copyWith(
                                                unselectedWidgetColor:
                                                    colorPallet5,
                                              ),
                                              child: Radio(
                                                value: 'female',
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        colorPallet2),
                                                groupValue: gender,
                                                onChanged: (dynamic value) {
                                                  setState(() {
                                                    gender = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text('زن',
                                                    style: primaryTextStyle()),
                                                Icon(
                                                  Icons.female_rounded,
                                                  color: colorPallet3,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        12.height,
                                        Text('کد ملی',
                                            style: boldTextStyle(
                                                color: colorPallet3)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                backgroundColor: colorPallet2
                                                    .withOpacity(0.2),
                                                child: const Icon(
                                                  LineAwesomeIcons
                                                      .identification_badge,
                                                  color: colorPallet2,
                                                  size: 30,
                                                )).paddingTop(10),
                                            5.width,
                                            Expanded(
                                              child: T2EditTextField(
                                                isPassword: false,
                                                mController: emailController,
                                                fontSize: 16.0,
                                              ).paddingLeft(50),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Text('شماره موبایل',
                                            style: boldTextStyle(
                                                color: colorPallet3)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                backgroundColor: colorPallet2
                                                    .withOpacity(0.2),
                                                child: Icon(
                                                  LineAwesomeIcons
                                                      .alternate_phone,
                                                  color: colorPallet2,
                                                  size: 30,
                                                )).paddingTop(10),
                                            5.width,
                                            Expanded(
                                              child: T2EditTextField(
                                                isPassword: false,
                                                mController: contactController,
                                                fontSize: 16.0,
                                              ).paddingLeft(50),
                                            ),
                                          ],
                                        ),
                                        15.height,
                                        Text('آدرس',
                                            style: boldTextStyle(
                                                color: colorPallet3)),
                                        6.height,
                                        T2EditTextField(
                                            isPassword: false,
                                            maxLine: 4,
                                            mController: addressController,
                                            fontSize: 16.0),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
                        colors: <Color>[colorPallet2, colorPallet1]),
                  ),
                  child: Text('ذخیره اطلاعات',
                      style: primaryTextStyle(size: 18, color: white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
