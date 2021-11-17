// import 'package:aroonshop/Class/user.dart';
import 'package:saffrun_app/models/user/user.dart';

class Comment {
  User user;
  String cmText;
  int likeCount;
  List<Comment> subComments = <Comment>[];
  bool showSub;
  DateTime date;
  String time;
  String uid;

  Comment(
      {required this.date,
      required this.cmText,
      required this.likeCount,
      this.showSub = false,
      required this.subComments,
      required this.time,
      required this.user,
      required this.uid});

  // static var comments = [
  //   Comment(user: User.test_user,cmText: 'لامپ بسیار زیبا و درخشانیه. خریدش رو پیشنهاد می کنم',likeCount: 7,time: '22:30',
  //     date: '17/7/1399',
  //     subComments: [Comment(user: User.test_user2,cmText: 'زیبا جادار مطمئن مثل امرسان',likeCount: 1,time: '23:30',
  //       date: '17/7/1399',)]
  //   ),
  //   Comment(user: User.test_user2,cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',likeCount: 7,time: '20:25',
  //       date: '11/7/1399',
  //   ),
  //   Comment(user: User.test_user2,cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',likeCount: 7,time: '20:25',
  //     date: '11/7/1399',
  //   ),
  //   Comment(user: User.test_user2,cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',likeCount: 7,time: '20:25',
  //     date: '11/7/1399',
  //   ),
  //   Comment(user: User.test_user2,cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',likeCount: 7,time: '20:25',
  //     date: '11/7/1399',
  //   ),
  //   Comment(user: User.test_user2,cmText: '''
  //   سلام
  //   یه طراحی می خوام که قشنگ چشم نواز و زیبا باشه
  //   حواستون باشه که حتما برای کنار درز ها و لامپ های ما یک آینه تعبیه کنید تا در شب های گرم تابستانی یک هجوم زمستانی را در پیش بگیریم
  //   با تشکر'''
  //   ,likeCount: 7,time: '20:25',
  //     date: '11/7/1399',
  //   ),
  //   Comment(user: User.test_user,cmText: 'لامپ بسیار زیبا و درخشانیه. خریدش رو پیشنهاد می کنم',likeCount: 7,time: '22:30',
  //       date: '17/7/1399',
  //       subComments: [Comment(user: User.test_user2,cmText: 'زیبا جادار مطمئن مثل امرسان',likeCount: 1,time: '23:30',
  //         date: '17/7/1399',),
  //         Comment(user: User.test_user2,cmText: 'زیبا جادار مطمئن مثل امرسان',likeCount: 1,time: '23:30',
  //           date: '17/7/1399',),
  //         Comment(user: User.test_user2,cmText: 'زیبا جادار مطمئن مثل امرسان',likeCount: 1,time: '23:30',
  //           date: '17/7/1399',),
  //         Comment(user: User.test_user2,cmText: 'زیبا جادار مطمئن مثل امرسان',likeCount: 1,time: '23:30',
  //           date: '17/7/1399',),
  //         Comment(user: User.test_user2,cmText: 'زیبا جادار مطمئن مثل امرسان',likeCount: 1,time: '23:30',
  //           date: '17/7/1399',),
  //       ]
  //   ),
  // ];

  static List<Comment> comments = <Comment>[];
}
