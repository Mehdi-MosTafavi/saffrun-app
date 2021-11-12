
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/admin/components/event_card.dart';
import 'package:saffrun_app/UI/admin/components/my_column.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';
import 'package:saffrun_app/models/event/event_model.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

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
    comments: '',
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
    comments: '',
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
    comments: '',
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
    comments: '',
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
    comments: '',
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
    comments: '',
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
    comments: '',
  ),
];

final List<String> imgList = [
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg',
  'assets/images/mafia1.jpg'
];

final String description =
    "به‌طور کلی در این بازی قدرت تکلم، حفظ خونسردی و آوردن استدلال‌های منطقی نقش بسزایی در پیروزی دارد. بازیکنان به‌طور مخفیانه نقش شان مشخص می‌شود؛ مافیاها همدیگر را می‌شناسند و شهروند که تنها از تعداد افراد مافیا آگاه هستند و عده معدودی از آن‌ها از برخی نقش‌ها اطلاع دارند. در فاز شب بازی، افراد مافیا به صورت مخفیانه یک شهروند را به قتل می‌رسانند. پزشک سعی می‌کند فردی که مافیا او را می‌خواهند به قتل برسانند را نجات دهد. کارآگاه نیز در پی شناختن مافیا است و اگر مافیا را شناسایی کند باید با استدلال به بقیه شهروندان ثابت کند او مافیا است. مافیا، پزشک، شهروند و کارآگاه شخصیت‌های اصلی بازی هستند و ممکن است در بازی‌های دیگر شخصیت‌های دیگری مانند تک تیرانداز هم به بازی اضافه شود. در طول فاز روز، تمام بازیکنان بازمانده در مورد هویت‌های مافیایی بحث می‌کنند و برای حذف یک مظنون رای‌گیری می‌کنند. بازی ادامه می‌یابد تا زمانی که همهٔ مافیاها از بازی بیرون بروند (برد شهروندان) یا تعداد مافیاها و شهروندان برابر شود (برد مافیا) یا یکی از شخصیت‌های مستقل که هر کدام شرایط برد متفاوتی دارد، برنده بازی شود. در یک بازی معمولاً نقش‌ها باید به گونه‌ای چیده شود که برای هر شخصیت، شخصیت‌های مقابل و مکمل قرار گیرد. مجموعه نمایش خانگی شب‌های مافیا و فیلم‌های گرگ‌بازی، گرگینه، آدمکش و همچنین بازی میان ما و اپیک از روی این بازی ساخته شده‌اند. همچنین مسابقه‌ای با عنوان شهروند و مافیا از شبکهٔ سلامت ایران به نمایش درآمد.";

Admin admin = Admin(1, 'بابک بهکام کیا', description, 'سرگرمی', imgList,
    imgList, imgList, imgList, imgList, '5');

int current = 0;
final CarouselController controller = CarouselController();

class _AdminPageState extends State<AdminPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(-1, 0.85),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(CupertinoIcons.calendar_circle_fill),
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
                            // height: context.height() * 0.2,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          admin.getName(),
                                          style: boldTextStyle(
                                              color: colorPallet1,
                                              size: 20),
                                        ),
                                      ),
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
                                                    Icons
                                                        .supervised_user_circle_sharp,
                                                    color: colorPallet3,
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets
                                                            .all(5),
                                                    child: Center(
                                                      child: Text(
                                                        admin.getCategory(),
                                                        style:
                                                            primaryTextStyle(
                                                          color:
                                                              colorPallet3,
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
                                  const SizedBox(
                                    // height: 20.0,
                                    width: 20.0,
                                  ),
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
                                          first_text:
                                              admin.getFollowers().length,
                                          second_text: 'دنبال کننده'),
                                      const SizedBox(
                                        // height: 20.0,
                                        width: 25.0,
                                      ),
                                      MyColumn(
                                          first_text:
                                              admin.getEvents().length,
                                          second_text: 'رویداد ها'),
                                    ],
                                  ),
                                ],
                              ).paddingLeft(10),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                            width: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: boxDecorationWithRoundedCorners(
                                      backgroundColor: colorPallet3),
                                  child: Center(
                                    child: Text(
                                      'دنبال کردن',
                                      style: boldTextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   // height: 20.0,
                              //   width: 100.0,
                              // ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RatingBarIndicator(
                                  rating: 2.75,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 25.0,
                                  direction: Axis.horizontal,
                                  textDirection: TextDirection.ltr,
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
                          Container(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'درباره کارفرما:',
                                    style: boldTextStyle(),
                                  ),
                                ),
                                DescriptionTextWidget(
                                    text: admin.getDescription()),
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
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                    width: context.width() * 0.5,
                                    // color: Colors.red,
                                    child: EventCardWidget(event: events[0])),
                                Container(
                                    width: context.width() * 0.5,
                                    // color: Colors.blue,
                                    child: EventCardWidget(event: events[1])),
                                Container(
                                    width: context.width()*0.5,
                                    // color: Colors.green,
                                    child: EventCardWidget(event: events[2])),
                                Container(
                                    width: context.width()*0.5,
                                    // color: Colors.yellow,
                                    child: EventCardWidget(event: events[3])),
                                Container(
                                    width: context.width()*0.5,
                                    // color: Colors.orange,
                                    child: EventCardWidget(event: events[4])),
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
                                onPressed: () {},
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

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(item),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

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
              children: <Widget>[
                Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
