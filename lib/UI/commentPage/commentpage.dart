// import 'package:aroonshop/Base/Connection.dart';
import 'package:saffrun_app/UI/commentPage/components/comments.dart';

// import 'package:aroonshop/Class/Product.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:like_button/like_button.dart';

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
  ScrollController _listScrrollController =  ScrollController();
  int currentpage = 1;

  String message = "";
  // late AnimationController sendAnimation;

  var textcontroller =  TextEditingController(text: '0');

  List<Comment> comments = <Comment>[];
  var formkey;
  late bool f;

  @override
  void initState() {
    textcontroller.text = '';
    f = false;
    // sendAnimation =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    formkey =  GlobalKey<FormState>();
    // TODO: implement initState
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
      child:  Directionality(
          textDirection: TextDirection.rtl,
          child:  Scaffold(
              // resizeToAvoidBottomPadding: false,
              resizeToAvoidBottomInset: false,
              body: Builder(
                builder: (context) {
                  return Container(
                    width: width,
                    height: height -
                        MediaQuery.of(context).viewInsets.bottom,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: (repIndex != -1)
                                ? (0.785 * height) -
                                MediaQuery.of(context)
                                    .viewInsets
                                    .bottom
                                : (0.825 * height) -
                                MediaQuery.of(context)
                                    .viewInsets
                                    .bottom,
                            color: Colors.grey[200],
                            child:  ListView.builder(
                                itemCount: comments.length,
                                controller: _listScrrollController,
                                itemBuilder: (context, index) {
                                  return  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.02 * width),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0.014 * height),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (comments[index]
                                                        .subComments.isNotEmpty) {
                                                      setState(() {
                                                        if (comments[
                                                        index]
                                                            .showSub ==
                                                            false) {
                                                          comments[index]
                                                              .showSub =
                                                          true;
                                                        } else {
                                                          comments[index]
                                                              .showSub =
                                                          false;
                                                        }
                                                      });
                                                    }
                                                  },
                                                  child:Container(),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (comments[index]
                                                        .subComments.isNotEmpty) {
                                                      setState(() {
                                                        if (comments[
                                                        index]
                                                            .showSub ==
                                                            false) {
                                                          comments[index]
                                                              .showSub =
                                                          true;
                                                        } else {
                                                          comments[index]
                                                              .showSub =
                                                          false;
                                                        }
                                                      });
                                                    }
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:
                                                        AutoSizeText(
                                                          comments[
                                                          index]
                                                              .user
                                                              .Name,
                                                          maxFontSize:
                                                          14,
                                                          maxLines: 10,
                                                          minFontSize:
                                                          11,
                                                          style:
                                                          const TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .w700,
                                                          ),
                                                          textAlign:
                                                          TextAlign
                                                              .start,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.004 *
                                                            height,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              right: 0.017 *
                                                                  width),
                                                          child:
                                                          AutoSizeText(
                                                            comments[
                                                            index]
                                                                .cmText,
                                                            maxFontSize:
                                                            14,
                                                            maxLines:
                                                            10,
                                                            minFontSize:
                                                            11,
                                                            style:
                                                            const TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                            ),
                                                            textAlign:
                                                            TextAlign
                                                                .start,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.004 *
                                                            height,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              right: 0.027 *
                                                                  width),
                                                          child:
                                                          AutoSizeText(
                                                            comments[
                                                            index]
                                                                .date
                                                                .hour
                                                                .toString() +
                                                                ':' +
                                                                comments[index]
                                                                    .date
                                                                    .minute
                                                                    .toString() +
                                                                " " +
                                                                comments[index]
                                                                    .date
                                                                    .year
                                                                    .toString() +
                                                                '/' +
                                                                comments[index]
                                                                    .date
                                                                    .month
                                                                    .toString() +
                                                                '/' +
                                                                comments[index]
                                                                    .date
                                                                    .day
                                                                    .toString(),
                                                            maxFontSize:
                                                            14,
                                                            maxLines: 8,
                                                            minFontSize:
                                                            11,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color: Colors
                                                                    .grey),
                                                            textAlign:
                                                            TextAlign
                                                                .start,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (repIndex ==
                                                                index) {
                                                              repIndex =
                                                              -1;
                                                            } else {
                                                              repIndex =
                                                                  index;
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                            width: 0.05 * width,
                                                            height: 0.05 * width,
                                                            child: LayoutBuilder(
                                                                builder: (context, constraint) =>  Icon(
                                                                  Icons.reply,
                                                                  size: constraint.biggest.height,
                                                                  color: Colors.red,
                                                                )))),
                                                    (comments[index]
                                                        .subComments
                                                        .length !=
                                                        0)
                                                        ? GestureDetector(
                                                        onTap: () {
                                                          setState(
                                                                  () {
                                                                if (comments[index].showSub ==
                                                                    false) {
                                                                  comments[index].showSub =
                                                                  true;
                                                                } else {
                                                                  comments[index].showSub =
                                                                  false;
                                                                }
                                                              });
                                                        },
                                                        child: Container(
                                                            width: 0.05 * width,
                                                            height: 0.05 * width,
                                                            child: LayoutBuilder(
                                                                builder: (context, constraint) =>  Icon(
                                                                  (comments[index].showSub) ? Icons.expand_less : Icons.expand_more,
                                                                  size: constraint.biggest.height,
                                                                  color: Colors.red,
                                                                ))))
                                                        :  Container()
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          AnimatedCrossFade(
                                            duration: Duration(
                                                milliseconds: 300),
                                            crossFadeState:
                                            (comments[index]
                                                .showSub ==
                                                true)
                                                ? CrossFadeState
                                                .showSecond
                                                : CrossFadeState
                                                .showFirst,
                                            firstChild:  Container(),
                                            secondChild: Container(
                                              width: width,
                                              child:
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                NeverScrollableScrollPhysics(),
                                                itemCount:
                                                comments[index]
                                                    .subComments
                                                    .length,
                                                itemBuilder: (con, i) {
                                                  return Container(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        0.05 *
                                                            width),
                                                    margin: EdgeInsets
                                                        .symmetric(
                                                        vertical: 0.01 *
                                                            height),
                                                    child:  Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child:Container(),
                                                        ),
                                                        Expanded(
                                                          flex: 5,
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                Alignment.centerRight,
                                                                child:
                                                                AutoSizeText(
                                                                  comments[index]
                                                                      .subComments[i]
                                                                      .user
                                                                      .Name,
                                                                  maxFontSize:
                                                                  14,
                                                                  maxLines:
                                                                  10,
                                                                  minFontSize:
                                                                  11,
                                                                  style:
                                                                  TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.w700,
                                                                  ),
                                                                  textAlign:
                                                                  TextAlign.start,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 0.004 *
                                                                    height,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                Alignment.centerRight,
                                                                child:
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(right: 0.017 * width),
                                                                  child:
                                                                  AutoSizeText(
                                                                    comments[index].subComments[i].cmText,
                                                                    maxFontSize:
                                                                    14,
                                                                    maxLines:
                                                                    10,
                                                                    minFontSize:
                                                                    11,
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                    textAlign:
                                                                    TextAlign.start,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 0.004 *
                                                                    height,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                Alignment.centerRight,
                                                                child:
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(right: 0.027 * width),
                                                                  child:
                                                                  AutoSizeText(
                                                                    comments[index].date.hour.toString() +
                                                                        ':' +
                                                                        comments[index].date.minute.toString() +
                                                                        " " +
                                                                        comments[index].date.year.toString() +
                                                                        '/' +
                                                                        comments[index].date.month.toString() +
                                                                        '/' +
                                                                        comments[index].date.day.toString(),
                                                                    style:
                                                                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                                                                    textAlign:
                                                                    TextAlign.start,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            sizeCurve:
                                            Curves.easeInQuad,
                                          ),
                                        ],
                                      ));
                                }),
                          ),
                          (repIndex != -1)
                              ?  Container(
                            width: width,
                            height: 0.04 * height,
                            color: Colors.grey[300],
                            child:  Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        0.016 * width),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          repIndex = -1;
                                        });
                                      },
                                      child:  Center(
                                        child: CircleAvatar(
                                            backgroundColor:
                                            Colors.red,
                                            child:  Icon(
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
                                      padding:
                                      EdgeInsets.symmetric(
                                          horizontal:
                                          0.02 * width),
                                      child:  Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            constraints:
                                            BoxConstraints(
                                                maxHeight:
                                                0.04 *
                                                    height,
                                                maxWidth: 0.3 *
                                                    width),
                                            child:
                                            AutoSizeText(
                                              comments[repIndex]
                                                  .user
                                                  .Name +
                                                  ': ',
                                              group: myGroup,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  fontSize: 14),
                                              maxLines: 1,
                                              minFontSize: 12,
                                              maxFontSize: 14,
                                            ),
                                          ),
                                          Container(
                                            constraints:
                                            BoxConstraints(
                                                maxHeight:
                                                0.04 *
                                                    height,
                                                maxWidth: 0.5 *
                                                    width),
                                            child:
                                            AutoSizeText(
                                              comments[repIndex]
                                                  .cmText,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontSize: 14),
                                              maxLines: 1,
                                              minFontSize: 12,
                                              maxFontSize: 14,
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
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
                              :  Container(),
                          Container(
                            width: width,
                            height: 0.065 * height,
                            color: Colors.grey[100],
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.06 * width),
                            child:  Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child:  TextFormField(
                                    controller: textcontroller,
                                    onSaved: (String? value) {
                                      message = value!;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'نظر دهید...'),
                                    maxLines: 6,
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ))),
    );
  }

}
/*

 */
