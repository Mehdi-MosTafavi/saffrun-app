// import 'package:like_button/like_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
import 'package:saffrun_app/logical/general/size_function.dart';

import '../../../models/comment/comment.dart';

class Message extends StatefulWidget {
  // double width = 0, height = 60;
  Color clr;

  CommentData comment;

  Message(
      {Key? key,
      // required this.width,
      // required this.height,
      required this.comment,
      required this.clr})
      : super(key: key);

  // Comment comment=cm;

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    super.initState();
    // if (widget.width == 0) {
    //   widget.width = MediaQuery.of(context).size.width;
    // }
  }

  @override
  Widget build(BuildContext context) {
    double width = context.width() * 0.6;
    double height = context.height() *
        (0.05 + (widget.comment.content.length / 25 + 1) * 0.02);
    double imHeight = context.height() * 0.075;
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            height: imHeight,
            color: widget.clr,
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(imHeight / 2)),
              ),
              child: Row(
                children: [
                  Container(
                    height: imHeight,
                    width: imHeight,
                    margin: const EdgeInsets.only(top: 0.0),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imageProvider)),
                        );
                      },
                      placeholder: (context, strImage) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        );
                      },
                      imageUrl: getImageUrlUsers(widget.comment.image),
                      fit: BoxFit.fill,
                      height: width * 0.32,
                      width: width * 0.32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: widget.clr,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.comment.userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Padding(
                      //     padding: EdgeInsets.only(left: 10),
                      //     child: Row(
                      //       children: [
                      //         LikeButton(
                      //           size: 20,
                      //           circleColor: CircleColor(
                      //               start: Color(0xff00ddff), end: Colors.red),
                      //           bubblesColor: BubblesColor(
                      //             dotPrimaryColor: Color(0xff33b5e5),
                      //             dotSecondaryColor: Color(0xff0099cc),
                      //           ),
                      //           likeBuilder: (bool isLiked) {
                      //             return Icon(
                      //               Icons.home,
                      //               color: isLiked ? Colors.red : Colors.grey,
                      //               size: 20,
                      //             );
                      //           },
                      //           likeCount: widget.comment.dislikeCount,
                      //         ),
                      //         LikeButton(
                      //           size: 20,
                      //           circleColor: CircleColor(
                      //               start: Color(0xff00ddff), end: Colors.red),
                      //           bubblesColor: BubblesColor(
                      //             dotPrimaryColor: Color(0xff33b5e5),
                      //             dotSecondaryColor: Color(0xff0099cc),
                      //           ),
                      //           likeBuilder: (bool isLiked) {
                      //             return Icon(
                      //               Icons.favorite,
                      //               color: isLiked ? Colors.red : Colors.grey,
                      //               size: 20,
                      //             );
                      //           },
                      //           likeCount: widget.comment.likeCount,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.comment.content,
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
