import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/utils/circular_progressbar_component.dart';
import 'package:saffrun_app/UI/utils/text_field_auto.dart';
import 'package:saffrun_app/models/user/user_2.dart';
import 'package:saffrun_app/state_managment/settings/setting_cubit.dart';

import '../../constants/theme_color.dart';
import '../../logical/general/size_function.dart';
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
  TextEditingController FamilyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late String gender;
  late File image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gender = UserProfile.userLogin.gender;
    nameController.text = UserProfile.userLogin.firstName;
    FamilyController.text = UserProfile.userLogin.lastName;
    addressController.text = UserProfile.userLogin.address;
    contactController.text = UserProfile.userLogin.phone;
    emailController.text = UserProfile.userLogin.email;
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
                                  padding: EdgeInsets.all(10),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
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
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: FileImage(
                                                                  state.file))),
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
                                                              getImageUrl(),
                                                          width: 80,
                                                          imageBuilder: (context,
                                                              imageProvider) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                      // borderRadius:
                                                                      //     BorderRadius
                                                                      //         .circular(
                                                                      //             16),
                                                                      shape: BoxShape
                                                                          .circle,
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
                                                  SizedBox(
                                                    width:
                                                        context.width() * 0.6,
                                                    child: Text(
                                                        UserProfile.userLogin
                                                            .getFullName(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: boldTextStyle(
                                                            color: white,
                                                            size: 19)),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                      UserProfile
                                                          .userLogin.username,
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
                                            if (state
                                                is! SettingEnterValidValue) {
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
                                            width: 45,
                                            height: 29,
                                            decoration: BoxDecoration(
                                                color: white,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                                (state is! SettingEnterValidValue)
                                                    ? Icons.edit
                                                    : Icons.delete,
                                                size: 17,
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
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('نام',
                                                          style: boldTextStyle(
                                                              color:
                                                                  colorPallet3))
                                                      .paddingRight(15),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            colorPallet2
                                                                .withOpacity(
                                                                    0.2),
                                                        child: const Icon(
                                                          LineAwesomeIcons
                                                              .user_1,
                                                          color: colorPallet2,
                                                          size: 30,
                                                        ),
                                                      ).paddingTop(10),
                                                      5.width,
                                                      Expanded(
                                                        child: AutoDirection(
                                                          text: nameController
                                                              .text,
                                                          child:
                                                              T2EditTextField(
                                                            isPassword: false,
                                                            onChanged: (text) {
                                                              setState(() {});
                                                            },
                                                            mController:
                                                                nameController,
                                                            fontSize: 16.0,
                                                          ).paddingLeft(50),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('نام خانوادگی',
                                                          style: boldTextStyle(
                                                              color:
                                                                  colorPallet3))
                                                      .paddingLeft(10),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            colorPallet2
                                                                .withOpacity(
                                                                    0.2),
                                                        child: const Icon(
                                                          LineAwesomeIcons
                                                              .user_tie,
                                                          color: colorPallet2,
                                                          size: 30,
                                                        ),
                                                      ).paddingTop(10),
                                                      5.width,
                                                      Expanded(
                                                        child: AutoDirection(
                                                          text: FamilyController
                                                              .text,
                                                          child:
                                                              T2EditTextField(
                                                            isPassword: false,
                                                            mController:
                                                                FamilyController,
                                                            onChanged: (text) {
                                                              setState(() {});
                                                            },
                                                            fontSize: 16.0,
                                                          ).paddingLeft(50),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        12.height,
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
                                        Text('ایمیل',
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
                                              child: AutoDirection(
                                                text: emailController.text,
                                                child: T2EditTextField(
                                                  isPassword: false,
                                                  mController: emailController,
                                                  onChanged: (text) {
                                                    setState(() {});
                                                  },
                                                  fontSize: 16.0,
                                                ).paddingLeft(50),
                                              ),
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
                                                )),
                                            5.width,
                                            Expanded(
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.ltr,
                                                child: T2EditTextField(
                                                  isPassword: false,
                                                  mController:
                                                      contactController,
                                                  number: true,
                                                  maxLength: 11,
                                                  fontSize: 16.0,
                                                ).paddingLeft(50),
                                              ),
                                            ),
                                          ],
                                        ),
                                        15.height,
                                        Text('آدرس',
                                            style: boldTextStyle(
                                                color: colorPallet3)),
                                        6.height,
                                        AutoDirection(
                                          text: addressController.text,
                                          child: T2EditTextField(
                                              isPassword: false,
                                              onChanged: (text) {
                                                setState(() {});
                                              },
                                              maxLine: 4,
                                              mController: addressController,
                                              fontSize: 16.0),
                                        ),
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
                child: BlocBuilder<SettingCubit, SettingState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        Map imageData = {'id': UserProfile.userLogin.imageId};
                        int imageId = UserProfile.userLogin.imageId;
                        if (contactController.text.length != 11 &&
                            contactController.text.length != 0) {
                          toast('شماره موبایل نامعتبر است.');
                          return;
                        }
                        if (emailController.text.length != 0) if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(emailController.text)) {
                          toast('ایمیل نامعتبر است.');
                          return;
                        }
                        if (state is SettingEnterValidValue) {
                          imageData =
                              await BlocProvider.of<SettingCubit>(context)
                                  .uploadImage(state.file);
                          await CachedNetworkImage.evictFromCache(
                              getImageUrl());
                          imageId = imageData['id'];
                          UserProfile.userLogin.image =
                              imageData['image']['full_size'];
                        }

                        Map<String, dynamic> userInfo = {
                          "username": UserProfile.userLogin.username,
                          "first_name": nameController.text,
                          "last_name": FamilyController.text,
                          "email": emailController.text,
                          "phone": contactController.text,
                          "country": "",
                          "province": "",
                          "image_id": imageId,
                          "gender": gender == "N"
                              ? "N"
                              : (gender == "male" ? "M" : "F"),
                          "address": addressController.text
                        };
                        print(userInfo);
                        bool status =
                            await BlocProvider.of<SettingCubit>(context)
                                .sendInformationUser(userInfo);
                        if (status) {
                          toast("تغییرات با موفقیت انجام شد.");
                        }
                        UserProfile.userLogin.imageId = imageId;
                        UserProfile.userLogin.email = emailController.text;
                        UserProfile.userLogin.firstName = nameController.text;
                        UserProfile.userLogin.lastName = FamilyController.text;
                        UserProfile.userLogin.address = addressController.text;
                        UserProfile.userLogin.phone = contactController.text;
                        UserProfile.userLogin.gender = (gender == "N"
                            ? ""
                            : (gender == "male" ? "male" : "female"));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: context.width(),
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[colorPallet2, colorPallet1]),
                        ),
                        child: state is SettingSendingProfileData
                            ? Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: CircularProgressBar(),
                              )
                            : Text('ذخیره اطلاعات',
                                style:
                                    primaryTextStyle(size: 18, color: white)),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
