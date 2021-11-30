// import 'package:aroonshop/Base/Connection.dart';
// import 'package:aroonshop/Class/Product.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/UI/commentPage/components/comments.dart';
import 'package:saffrun_app/UI/utils/appbar/appbar_type1.dart';
import 'package:saffrun_app/constants/theme_color.dart';

// import 'package:saffrun_app/UI/utils/calender/shared/utils.dart';
import 'package:saffrun_app/models/user/user.dart';

// import 'components/add_comment.dart';
import 'components/message.dart';
// import 'package:like_button/like_button.dart';

// import '../AppBar.dart';

class CommentPage extends StatefulWidget {
  // Product product;

  CommentPage();

  @override
  State<StatefulWidget> createState() => CommentPageState();
}

class CommentPageState extends State<CommentPage>
    with SingleTickerProviderStateMixin {




  int repIndex = -1;

  bool Refresh = true;
  bool Add = true;
  bool _IsLoading = false;
  ScrollController _listScrrollController = ScrollController();
  int currentpage = 1;

  String message = "";

  // late AnimationController sendAnimation;

  var textcontroller = TextEditingController(text: '0');

  List<Comment> comments = <Comment>[];
  var formkey;
  late bool f;

  // babak variables

  var replyComment;

  User babak = User(
      Name: 'babak',
      LastName: 'behkam',
      Phone: '123456789',
      Address: 'tabriz',
      Type: 0,
      cmText: 'my name is babak');
  User javad = User(
      Name: 'javad',
      LastName: 'tabar',
      Phone: '123456789',
      Address: 'babol',
      Type: 0,
      cmText: 'سلام خوشگلا');
  User amir = User(
      Name: 'amir',
      LastName: 'samavat',
      Phone: '123456789',
      Address: 'tehran',
      Type: 0,
      cmText: 'فشار بخور');
  User ali = User(
      Name: 'ali',
      LastName: 'alamdari',
      Phone: '123456789',
      Address: 'semnan',
      Type: 0,
      cmText: 'my name is ali');

  @override
  void initState() {
    textcontroller.text = '';
    f = false;
    // sendAnimation =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    formkey = GlobalKey<FormState>();
    // TODO: implement initState

    comments = Comment.comments;

    super.initState();
    _listScrrollController.addListener(() async {
      double maxScroll = _listScrrollController.position.maxScrollExtent;
      double currentScroll = _listScrrollController.position.pixels;

      if (maxScroll - currentScroll <= 300) {
        if (!_IsLoading && !f) {
          currentpage++;
          Refresh = true;
          Add = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AutoSizeGroup myGroup = AutoSizeGroup();
    return Form(
      key: formkey,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBarTitleProfile(
                context,
                0,
                title: '',
                functionBack: () {},
              ),
              body: Builder(
                builder: (context) {
                  return Container(
                    width: width,
                    height: height - MediaQuery.of(context).viewInsets.bottom,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: context.height(),
                          child: ListView.builder(
                              itemCount: comments.length,
                              controller: _listScrrollController,
                              padding: const EdgeInsets.only(bottom: 150),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.02 * width),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.014 * height),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (comments[index]
                                                .subComments
                                                .isNotEmpty) {
                                              setState(() {
                                                if (comments[index].showSub ==
                                                    false) {
                                                  comments[index].showSub =
                                                      true;
                                                } else {
                                                  comments[index].showSub =
                                                      false;
                                                }
                                              });
                                            }
                                          },
                                          child: Message(
                                            comment: comments[index],
                                            clr: colorPallet5,
                                          ),
                                        ),
                                        // AnimatedCrossFade(
                                        //   duration: Duration(milliseconds: 300),
                                        //   crossFadeState:
                                        //       (comments[index].showSub == true)
                                        //           ? CrossFadeState.showSecond
                                        //           : CrossFadeState.showFirst,
                                        //   firstChild: Container(),
                                        //   secondChild: Container(
                                        //     width: width,
                                        //     child: ListView.builder(
                                        //       shrinkWrap: true,
                                        //       physics:
                                        //           NeverScrollableScrollPhysics(),
                                        //       itemCount: comments[index]
                                        //           .subComments
                                        //           .length,
                                        //       itemBuilder: (con, i) {
                                        //         return Container(
                                        //           padding: EdgeInsets.symmetric(
                                        //               horizontal: 0.05 * width),
                                        //           margin: EdgeInsets.symmetric(
                                        //               vertical: 0.01 * height),
                                        //           child: Row(
                                        //             children: [
                                        //               Expanded(
                                        //                 flex: 1,
                                        //                 child: Container(),
                                        //               ),
                                        //               Expanded(
                                        //                 flex: 5,
                                        //                 child: Column(
                                        //                   children: [
                                        //                     Message(
                                        //                       comment: comments[index],
                                        //                       // height: context.height() *
                                        //                       //     0.1,
                                        //                       // width:
                                        //                       // context.width() * 0.8,
                                        //                       clr: colorPallet4,
                                        //                     ),
                                        //
                                        //
                                        //                     SizedBox(
                                        //                       height: 0.004 *
                                        //                           height,
                                        //                     ),
                                        //                     Align(
                                        //                       alignment: Alignment
                                        //                           .centerRight,
                                        //                       child: Padding(
                                        //                         padding: EdgeInsets.only(
                                        //                             right: 0.027 *
                                        //                                 width),
                                        //                         child:
                                        //                             AutoSizeText(
                                        //                           comments[
                                        //                                       index]
                                        //                                   .date
                                        //                                   .hour
                                        //                                   .toString() +
                                        //                               ':' +
                                        //                               comments[
                                        //                                       index]
                                        //                                   .date
                                        //                                   .minute
                                        //                                   .toString() +
                                        //                               " " +
                                        //                               comments[
                                        //                                       index]
                                        //                                   .date
                                        //                                   .year
                                        //                                   .toString() +
                                        //                               '/' +
                                        //                               comments[
                                        //                                       index]
                                        //                                   .date
                                        //                                   .month
                                        //                                   .toString() +
                                        //                               '/' +
                                        //                               comments[
                                        //                                       index]
                                        //                                   .date
                                        //                                   .day
                                        //                                   .toString(),
                                        //                           style: TextStyle(
                                        //                               fontWeight:
                                        //                                   FontWeight
                                        //                                       .w400,
                                        //                               color: Colors
                                        //                                   .grey),
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .start,
                                        //                         ),
                                        //                       ),
                                        //                     )
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         );
                                        //       },
                                        //     ),
                                        //   ),
                                        //   sizeCurve: Curves.easeInQuad,
                                        // ),
                                      ],
                                    ));
                              }),
                        ),
                        (repIndex != -1)
                            ? Container(
                                width: width,
                                height: 0.04 * height,
                                color: Colors.grey[300],
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.all(0.016 * width),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              repIndex = -1;
                                            });
                                          },
                                          child: Center(
                                            child: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 14,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 0.7 * width),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.02 * width),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxHeight: 0.04 * height,
                                                    maxWidth: 0.3 * width),
                                                child: AutoSizeText(
                                                  comments[repIndex].user.Name +
                                                      ': ',
                                                  group: myGroup,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14),
                                                  maxLines: 1,
                                                  minFontSize: 12,
                                                  maxFontSize: 14,
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxHeight: 0.04 * height,
                                                    maxWidth: 0.5 * width),
                                                child: AutoSizeText(
                                                  comments[repIndex].cmText,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                  maxLines: 1,
                                                  minFontSize: 12,
                                                  maxFontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      /*
                                    Container(
                                      constraints: BoxConstraints(maxWidth: 0.40*width),
                                      child:  Text.rich(
                                         TextSpan(
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan> [
                                               TextSpan(text:"محمد صادق جعفری" + ': ', style: TextStyle(fontWeight: FontWeight.w700)),
                                               TextSpan(text:'سلام خوبی پسرم حالت خوبه سلامتی برای عید می خوایم سفره بگیریم تو هم میای؟', style: TextStyle(fontWeight: FontWeight.w400),),
                                            ]
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                     */
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: width,
                            height: context.height() * 0.08,
                            color: Colors.grey[100],
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.symmetric(horizontal: 0.06 * width),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: TextFormField(
                                    controller: textcontroller,
                                    onChanged: (String? value){
                                      message = value!;
                                    },
                                    // onSaved: (String? value) {
                                    //   message = value!;
                                    // },

                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'نظر دهید...'),
                                    maxLines: 6,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        if(message!='') {
                                          Comment new_comment = Comment(
                                              user: User.test_user,
                                              cmText: message,
                                              likeCount: 0,
                                              dislikeCount: 0,
                                              time: '22:30',
                                              date: DateTime(10, 10, 2020),
                                              subComments: []);
                                          comments.add(new_comment);
                                          message = '';
                                        }
                                      });
                                      // CreateNewComment(user: comments[1].user,text: message);

                                    },
                                    child: Icon(Icons.send,
                                        size: 25, color: Colors.green),
                                  ),
                                ),
                                //  Expanded(
                                //   flex: 1,
                                //   child:  Align(
                                //       alignment: Alignment.centerLeft,
                                //       child:  AnimatedIconButton(
                                //         startIcon: Icon(Icons.send,
                                //             size: 25,
                                //             color: Colors.red),
                                //         endIcon: Icon(Icons.more_horiz,
                                //             size: 25,
                                //             color: Colors.red),
                                //         onPressed: () async {
                                //           formkey.currentState.save();
                                //           if (message.length != 0) {
                                //             await sendAnimation
                                //                 .forward();
                                //             try {
                                //               if (repIndex != -1)
                                //                 await ProductConnection
                                //                     .AddComment(
                                //                         widget.product
                                //                             .Uid,
                                //                         comments[
                                //                                 repIndex]
                                //                             .uid,
                                //                         message);
                                //               else
                                //                 await ProductConnection
                                //                     .AddComment(
                                //                         widget.product
                                //                             .Uid,
                                //                         null,
                                //                         message);
                                //               repIndex = -1;
                                //               sendAnimation.reverse();
                                //               Fluttertoast.showToast(
                                //                 msg:
                                //                     "نظر برای تایید ادمین فرستاده شد",
                                //                 toastLength:
                                //                     Toast.LENGTH_SHORT,
                                //                 gravity:
                                //                     ToastGravity.BOTTOM,
                                //                 timeInSecForIosWeb: 3,
                                //                 backgroundColor: Colors
                                //                     .black
                                //                     .withOpacity(0.8),
                                //                 textColor: Colors.white,
                                //                 fontSize: 18.0,
                                //               );
                                //               textcontroller.text = '';
                                //               setState(() {});
                                //             } catch (e) {
                                //               sendAnimation.reverse();
                                //               Fluttertoast.showToast(
                                //                 msg: "ناموفق",
                                //                 toastLength:
                                //                     Toast.LENGTH_SHORT,
                                //                 gravity:
                                //                     ToastGravity.BOTTOM,
                                //                 timeInSecForIosWeb: 3,
                                //                 backgroundColor:
                                //                     Colors.grey[700],
                                //                 textColor: Colors.white,
                                //                 fontSize: 18.0,
                                //               );
                                //             }
                                //           } else {
                                //             Fluttertoast.showToast(
                                //               msg:
                                //                   "برای ارسال ابتدا نظر خود را وارد کنید",
                                //               toastLength:
                                //                   Toast.LENGTH_SHORT,
                                //               gravity:
                                //                   ToastGravity.BOTTOM,
                                //               timeInSecForIosWeb: 3,
                                //               backgroundColor:
                                //                   Colors.grey[700],
                                //               textColor: Colors.white,
                                //               fontSize: 18.0,
                                //             );
                                //           }
                                //         },
                                //         animationController:
                                //             sendAnimation,
                                //       )),
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ))),
    );
  }
}
/*

 */
