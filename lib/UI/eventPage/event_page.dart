import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/UI/commentPage/commentpage.dart';
// import 'package:saffrun_app/UI/eventPage/components/add_button.dart';
import 'package:saffrun_app/constants/theme_color.dart';

import 'components/payment_button.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

int current = 0;
final CarouselController controller = CarouselController();

final String description =
    "به‌طور کلی در این بازی قدرت تکلم، حفظ خونسردی و آوردن استدلال‌های منطقی نقش بسزایی در پیروزی دارد. بازیکنان به‌طور مخفیانه نقش شان مشخص می‌شود؛ مافیاها همدیگر را می‌شناسند و شهروند که تنها از تعداد افراد مافیا آگاه هستند و عده معدودی از آن‌ها از برخی نقش‌ها اطلاع دارند. در فاز شب بازی، افراد مافیا به صورت مخفیانه یک شهروند را به قتل می‌رسانند. پزشک سعی می‌کند فردی که مافیا او را می‌خواهند به قتل برسانند را نجات دهد. کارآگاه نیز در پی شناختن مافیا است و اگر مافیا را شناسایی کند باید با استدلال به بقیه شهروندان ثابت کند او مافیا است. مافیا، پزشک، شهروند و کارآگاه شخصیت‌های اصلی بازی هستند و ممکن است در بازی‌های دیگر شخصیت‌های دیگری مانند تک تیرانداز هم به بازی اضافه شود. در طول فاز روز، تمام بازیکنان بازمانده در مورد هویت‌های مافیایی بحث می‌کنند و برای حذف یک مظنون رای‌گیری می‌کنند. بازی ادامه می‌یابد تا زمانی که همهٔ مافیاها از بازی بیرون بروند (برد شهروندان) یا تعداد مافیاها و شهروندان برابر شود (برد مافیا) یا یکی از شخصیت‌های مستقل که هر کدام شرایط برد متفاوتی دارد، برنده بازی شود. در یک بازی معمولاً نقش‌ها باید به گونه‌ای چیده شود که برای هر شخصیت، شخصیت‌های مقابل و مکمل قرار گیرد. مجموعه نمایش خانگی شب‌های مافیا و فیلم‌های گرگ‌بازی، گرگینه، آدمکش و همچنین بازی میان ما و اپیک از روی این بازی ساخته شده‌اند. همچنین مسابقه‌ای با عنوان شهروند و مافیا از شبکهٔ سلامت ایران به نمایش درآمد.";

class _EventPageState extends State<EventPage> {
  late ScrollController scrollController;

  late final List<AssetImage> imgList;
  late final List<Widget> imageSliders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    imgList = [
      AssetImage('assets/images/mafia1.jpg'),
      AssetImage('assets/images/mafia2.jpg'),
      AssetImage('assets/images/mafia3.jpg'),
      AssetImage('assets/images/mafia4.jpg')
    ];
    imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: item,
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton(
          onPressed: () {
            // showDialogForParticipantEvent(context);
            showDialogForPayment(context);
          },
          child: const Icon(Icons.add),
          backgroundColor: colorPallet5,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: context.height(),
          width: context.width(),
          decoration: const BoxDecoration(color: colorPallet5),
          child: Stack(
            children: [
              Column(children: [
                CarouselSlider(
                  items: imageSliders,
                  carouselController: controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => controller.animateToPage(entry.key),
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
                                .withOpacity(current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ]),
              DraggableScrollableSheet(
                  initialChildSize: 0.68,
                  minChildSize: 0.65,
                  builder: (context, scrollController) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          const SizedBox(
                            height: 50.0,
                            width: 2.0,
                            child: Divider(
                              color: Colors.red,
                              indent: 100,
                              endIndent: 100,
                            ),
                          ),
                          SizedBox(
                            height: context.height() * 0.07,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "بازی مافیا",
                                          style: boldTextStyle(
                                              color: colorPallet1, size: 20),
                                        ),
                                      ),
                                      15.width,
                                      FractionallySizedBox(
                                        heightFactor: 0.7,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration:
                                              boxDecorationWithRoundedCorners(
                                                  backgroundColor: colorPallet5,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                          child: Center(
                                            child: Text(
                                              "10%",
                                              style: primaryTextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "کافه رخ",
                                        style: boldTextStyle(
                                          color: colorPallet5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingLeft(10),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.category_outlined,
                                color: colorPallet2,
                              ),
                              Container(
                                child: Text(
                                  "سرگرمی",
                                  style: primaryTextStyle(
                                      color: colorPallet2, size: 18),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                            width: 20.0,
                          ),
                          SizedBox(
                            height: context.height() * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  // alignment: WrapAlignment.start,
                                  direction: Axis.vertical,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'تاریخ شروع: ',
                                          style: primaryTextStyle(),
                                        ),
                                        Text(
                                          '10 آبان | 8:00',
                                          style: boldTextStyle(),
                                        ),
                                      ],
                                    ).paddingSymmetric(horizontal: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'تاریخ پایان: ',
                                          style: primaryTextStyle(),
                                        ),
                                        Text(
                                          '10 آبان | 14:00',
                                          style: boldTextStyle(),
                                        ),
                                      ],
                                    ).paddingSymmetric(horizontal: 10),
                                  ],
                                ),
                                Align(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: colorPallet3,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Center(
                                          child: Text(
                                            "10",
                                            style: primaryTextStyle(
                                              color: colorPallet3,
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
                          const SizedBox(
                            height: 50.0,
                            width: 150.0,
                            child: Divider(
                              color: Colors.red,
                              indent: 100,
                              endIndent: 100,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'درباره ایونت:',
                                    style: boldTextStyle(),
                                  ),
                                ),
                                DescriptionTextWidget(text: description),
                              ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'نظرات:',
                                style: boldTextStyle(),
                              ),
                              TextButton(
                                onPressed: () {
                                  pushNewScreen(
                                    context,
                                    screen: CommentPage(),
                                    withNavBar: false,
                                    // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: const Text('نظر دهید ...'),
                              )
                            ],
                          ),
                          Container(
                            height: 300,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              // itemExtent: ,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  leading: const CircleAvatar(
                                    backgroundColor: colorPallet1,
                                    child: Icon(Icons.house_rounded),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'بابک بهکام کیا',
                                        style: boldTextStyle(),
                                      ),
                                      Text(
                                        'ایونت خیلی عالی است',
                                        style: secondaryTextStyle(),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: 2,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}


class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

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
        crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.start,
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
