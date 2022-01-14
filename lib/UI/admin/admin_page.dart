import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/admin/components/event_card.dart';
import 'package:saffrun_app/UI/admin/components/my_column.dart';
import 'package:saffrun_app/UI/commentPage/commentpage.dart';
import 'package:saffrun_app/UI/reserve/reserve_page.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/logical/general/size_function.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';
import 'package:saffrun_app/models/event/event_model.dart';

import '../../models/comment/comment.dart';
import '../../state_managment/admin/admin_cubit.dart';

class AdminPage extends StatefulWidget {
  int adminId;
  Object? heroTag;

  AdminPage({Key? key, required this.adminId, this.heroTag}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

List<Event> events = [
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
  Event(
    id: 1,
    title: 'بازی مافیا',
    description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
    imageUrl: '',
    discount: 10,
    ownerId: 2,
    startTime: DateTime(2020),
    finishTime: DateTime(2021),
    comments: [],
  ),
];

const String description =
    "به‌طور کلی در این بازی قدرت تکلم، حفظ خونسردی و آوردن استدلال‌های منطقی نقش بسزایی در پیروزی دارد. بازیکنان به‌طور مخفیانه نقش شان مشخص می‌شود؛ مافیاها همدیگر را می‌شناسند و شهروند که تنها از تعداد افراد مافیا آگاه هستند و عده معدودی از آن‌ها از برخی نقش‌ها اطلاع دارند. در فاز شب بازی، افراد مافیا به صورت مخفیانه یک شهروند را به قتل می‌رسانند. پزشک سعی می‌کند فردی که مافیا او را می‌خواهند به قتل برسانند را نجات دهد. کارآگاه نیز در پی شناختن مافیا است و اگر مافیا را شناسایی کند باید با استدلال به بقیه شهروندان ثابت کند او مافیا است. مافیا، پزشک، شهروند و کارآگاه شخصیت‌های اصلی بازی هستند و ممکن است در بازی‌های دیگر شخصیت‌های دیگری مانند تک تیرانداز هم به بازی اضافه شود. در طول فاز روز، تمام بازیکنان بازمانده در مورد هویت‌های مافیایی بحث می‌کنند و برای حذف یک مظنون رای‌گیری می‌کنند. بازی ادامه می‌یابد تا زمانی که همهٔ مافیاها از بازی بیرون بروند (برد شهروندان) یا تعداد مافیاها و شهروندان برابر شود (برد مافیا) یا یکی از شخصیت‌های مستقل که هر کدام شرایط برد متفاوتی دارد، برنده بازی شود. در یک بازی معمولاً نقش‌ها باید به گونه‌ای چیده شود که برای هر شخصیت، شخصیت‌های مقابل و مکمل قرار گیرد. مجموعه نمایش خانگی شب‌های مافیا و فیلم‌های گرگ‌بازی، گرگینه، آدمکش و همچنین بازی میان ما و اپیک از روی این بازی ساخته شده‌اند. همچنین مسابقه‌ای با عنوان شهروند و مافیا از شبکهٔ سلامت ایران به نمایش درآمد.";

int current = 0;
final CarouselController controller = CarouselController();

class _AdminPageState extends State<AdminPage> {
  late ScrollController scrollController;
  late bool follow;
  late Admin adminSave;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    follow = false;
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit(),
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: () {
              pushNewScreen(
                context,
                screen: ReservePage(
                  adminId: adminSave,
                ),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: const Icon(CupertinoIcons.calendar_circle_fill),
            backgroundColor: colorPallet5,
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<AdminCubit, AdminState>(
            builder: (context, state) {
              if (state is AdminInitial) {
                BlocProvider.of<AdminCubit>(context).fetchEvent(widget.adminId);
              }
              if (state is AdminLoad) {
                Admin admin = state.admin;
                adminSave = state.admin;
                return Container(
                  height: context.height(),
                  width: context.width(),
                  decoration: const BoxDecoration(color: colorPallet5),
                  child: Stack(
                    children: [
                      Column(children: [
                        Hero(
                          tag: widget.heroTag ?? "",
                          child: CarouselSlider(
                            items: state.admin.imageUrls
                                .map((item) => CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: imageProvider)),
                                        );
                                      },
                                      placeholder: (context, strImage) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2.0,
                                            ),
                                          ),
                                        );
                                      },
                                      imageUrl: item,
                                      fit: BoxFit.fill,
                                      height: context.width() * 0.32,
                                      width: context.height() * 0.6,
                                    ))
                                .toList(),
                            carouselController: controller,
                            options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reason) {
                                  print(index);
                                  setState(() {
                                    current = index;
                                  });
                                }),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0;
                                  i < state.admin.imageUrls.length;
                                  i++)
                                GestureDetector(
                                  onTap: () => controller.animateToPage(i),
                                  child: Container(
                                    width: 12.0,
                                    height: 12.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.white)
                                            .withOpacity(
                                                current == i ? 0.9 : 0.4)),
                                  ),
                                )
                            ]),
                      ]),
                      DraggableScrollableSheet(
                          initialChildSize: 0.68,
                          minChildSize: 0.65,
                          builder: (context, scrollController) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                physics: const ClampingScrollPhysics(),
                                controller: scrollController,
                                children: [
                                  30.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            admin.title,
                                            style: boldTextStyle(
                                                color: colorPallet1, size: 20),
                                          ),
                                          5.height,
                                          SizedBox(
                                            // height: context.height() * 0.07,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons.category_outlined,
                                                        color: colorPallet5,
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Center(
                                                          child: Text(
                                                            admin.category,
                                                            style:
                                                                primaryTextStyle(
                                                              color:
                                                                  colorPallet5,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      15.width,
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () async {
                                            setState(() {
                                              if (admin.isFollowing) {
                                                admin.followerCount -= 1;
                                              } else {
                                                admin.followerCount += 1;
                                              }
                                              admin.isFollowing =
                                                  !admin.isFollowing;
                                            });
                                            bool status = await BlocProvider.of<
                                                    AdminCubit>(context)
                                                .followAdmin(admin.ownerId);
                                            if (!status) {
                                              setState(() {
                                                if (admin.isFollowing) {
                                                  admin.followerCount += 1;
                                                } else {
                                                  admin.followerCount -= 1;
                                                }
                                                admin.isFollowing =
                                                    !admin.isFollowing;
                                              });
                                            }
                                          },
                                          child: admin.isFollowing
                                              ? Container(
                                                  height: 50,
                                                  width: 100,
                                                  decoration:
                                                      boxDecorationWithRoundedCorners(
                                                          border: Border.all(
                                                              width: 2,
                                                              color:
                                                                  colorPallet3),
                                                          backgroundColor:
                                                              Colors.white),
                                                  child: Center(
                                                    child: Text(
                                                      'لفو دنبال',
                                                      style: boldTextStyle(
                                                          color: colorPallet3),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 50,
                                                  width: 100,
                                                  decoration:
                                                      boxDecorationWithRoundedCorners(
                                                          backgroundColor:
                                                              colorPallet3),
                                                  child: Center(
                                                    child: Text(
                                                      'دنبال کردن',
                                                      style: boldTextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ).paddingLeft(10),
                                  const SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          // MyColumn(
                                          //     first_text: admin
                                          //         .getFollowing()
                                          //         .length,
                                          //     second_text: 'following'),
                                          const SizedBox(
                                            // height: 20.0,
                                            width: 20.0,
                                          ),
                                          MyColumn(
                                              first_text: admin.followerCount,
                                              second_text: 'دنبال کننده'),
                                          const SizedBox(
                                            // height: 20.0,
                                            width: 25.0,
                                          ),
                                          MyColumn(
                                              first_text: admin.events.length,
                                              second_text: 'رویداد ها'),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   // height: 20.0,
                                      //   width: 100.0,
                                      // ),
                                      Align(
                                        alignment: Alignment(-1, 0.5),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                // Icon(
                                                //   Icons.stars_outlined,
                                                //   color: Colors.amber,
                                                // ),
                                                // 5.width,
                                                Text(
                                                  admin.rateCount == 0
                                                      ? "رای داده نشده"
                                                      : admin.rate.toString(),
                                                  style: boldTextStyle(
                                                      color: colorPallet2),
                                                ),
                                              ],
                                            ),
                                            RatingBar.builder(
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 25.0,
                                              initialRating:
                                                  admin.rateInitial.toDouble(),
                                              glow: false,
                                              direction: Axis.horizontal,
                                              textDirection: TextDirection.ltr,
                                              onRatingUpdate:
                                                  (double value) async {
                                                try {
                                                  double rate = await BlocProvider
                                                          .of<AdminCubit>(
                                                              context)
                                                      .adminRepository
                                                      .adminNetworkService
                                                      .postRateOfAdminToServer(
                                                          state.admin.ownerId,
                                                          value);
                                                  state.admin.rate =
                                                      double.parse(rate
                                                          .toStringAsFixed(2));
                                                  admin.rateCount += 1;
                                                  setState(() {});
                                                  toast(
                                                      'امتیاز با موفقیت ثبت شد');
                                                } catch (e) {
                                                  toast('با مشکل مواجه شد');
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                  ),
                                  const SizedBox(
                                    height: 50.0,
                                    width: 150.0,
                                    child: Divider(
                                      color: Colors.red,
                                      indent: 100,
                                      endIndent: 100,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'درباره کارفرما:',
                                          style: boldTextStyle(),
                                        ),
                                      ),
                                      DescriptionTextWidget(
                                          text: admin.description),
                                    ],
                                  ),
                                  const SizedBox(
                                    child: Divider(
                                      color: Colors.red,
                                      indent: 100,
                                      endIndent: 100,
                                    ),
                                  ),
                                  6.height,
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'رویداد های اخیر:',
                                      style: boldTextStyle(),
                                    ),
                                  ),
                                  state.admin.events.length != 0
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          height: 280,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return EventCardWidget(
                                                  event: state
                                                      .admin.events[index]);
                                            },
                                            itemCount:
                                                state.admin.events.length,
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Center(
                                            child: Text(
                                              'هیچ رویدادی وجود ندارد',
                                              style: primaryTextStyle(),
                                            ),
                                          ),
                                        ),
                                  const SizedBox(
                                    child: Divider(
                                      color: Colors.red,
                                      indent: 100,
                                      endIndent: 100,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'نظرات:',
                                        style: boldTextStyle(),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          pushNewScreen(
                                            context,
                                            screen: CommentPage(
                                              adminId: widget.adminId,
                                            ),
                                            withNavBar: false,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: const Text(
                                          'نظر دهید ...',
                                          style: TextStyle(color: colorPallet3),
                                        ),
                                      )
                                    ],
                                  ),
                                  state.admin.comments.isNotEmpty
                                      ? SizedBox(
                                          height: 300,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            // itemExtent: ,
                                            itemBuilder: (context, index) {
                                              CommentData comment =
                                                  state.admin.comments[index];
                                              return ListTile(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                leading: CircleAvatar(
                                                  backgroundColor: colorPallet1,
                                                  child: Text(
                                                    getDateForCircle(
                                                        comment.date),
                                                    style: secondaryTextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      comment.userName,
                                                      style: boldTextStyle(),
                                                    ),
                                                    Text(
                                                      comment.content,
                                                      style:
                                                          secondaryTextStyle(),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount:
                                                state.admin.comments.length,
                                          ),
                                        )
                                      : const Center(
                                          child: Text("هیچ نظری یافت نشد"))
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                );
              }
              return SafeArea(
                  child: Container(
                height: context.height(),
                width: context.width(),
                decoration: const BoxDecoration(color: Colors.white),
                child: const Center(
                  child: Text('لطفا چند لحظه صبر کنید'),
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              textAlign: TextAlign.start,
            )
          : Column(
              children: <Widget>[
                Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        flag ? "بیشتر" : "کمتر",
                        style: const TextStyle(color: colorPallet4),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
