// import 'package:like_button/like_button.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
// import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/UI/commentPage/components/comments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  // double width = 0, height = 60;
  Color clr;

  Comment comment;

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
    double width=context.width()*0.6;
    double height=context.height()*(0.05 + (widget.comment.cmText.length/25 +1)*0.02);
    double im_height=context.height()*0.075;
        return Column(
      children: <Widget>[
        Container(
          height: im_height,
          width: width,
          color: widget.clr,
          child: Material(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(im_height / 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: im_height,
                  height: im_height,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image: ExactAssetImage('images/mafia1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: new Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: height,
          width: width,
          child: Material(
            color: widget.clr,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(height / 3),
              bottomRight: Radius.circular(height / 3),
              topLeft: Radius.circular(height / 3),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.comment.user.Name +
                              ' ' +
                              widget.comment.user.LastName,
                          style: TextStyle(
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
                      widget.comment.cmText,
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
