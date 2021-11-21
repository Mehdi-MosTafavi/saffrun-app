// import 'package:aroonshop/Class/user.dart';
import 'package:saffrun_app/models/user/user.dart';

class Comment {
  User user;
  String cmText;
  int likeCount;
  int dislikeCount;
  List<Comment> subComments = <Comment>[];
  bool showSub;
  DateTime date;
  String time;

  Comment({
    required this.date,
    required this.cmText,
    required this.likeCount,
    required this.dislikeCount,
    this.showSub = false,
    required this.subComments,
    required this.time,
    required this.user,
  });

  static var comments = [
    Comment(
        user: User.test_user,
        cmText: 'لامپ بسیار زیبا و درخشانیه. خریدش رو پیشنهاد می کنم',
        likeCount: 7,
        dislikeCount: 2,
        time: '22:30',
        date: DateTime(10, 10, 2020),
        subComments: [
          Comment(
            user: User.test_user2,
            cmText: 'زیبا جادار مطمئن مثل امرسان',
            likeCount: 1,
            dislikeCount: 7,
            time: '23:30',
            date: DateTime(10, 10, 2020),
            subComments: [],
          )
        ]),
    Comment(
      user: User.test_user2,
      cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',
      likeCount: 7,
      dislikeCount: 2,
      time: '20:25',
      date: DateTime(10, 10, 2020),
      subComments: [
        Comment(
          user: User.test_user2,
          cmText: 'زیبا جادار مطمئن مثل امرسان',
          likeCount: 1,
          dislikeCount: 7,
          time: '23:30',
          date: DateTime(10, 10, 2020),
          subComments: [],
        )
      ],
    ),
    Comment(
      user: User.test_user2,
      cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',
      likeCount: 7,
      dislikeCount: 2,
      time: '20:25',
      date: DateTime(10, 10, 2020),
      subComments: [],
    ),
    Comment(
      user: User.test_user2,
      cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',
      likeCount: 7,
      dislikeCount: 2,
      time: '20:25',
      date: DateTime(10, 10, 2020),
      subComments: [],
    ),
    Comment(
      user: User.test_user2,
      cmText: 'قدرت در اوج کیفیت، کیفیت در اوج قدرت',
      likeCount: 7,
      dislikeCount: 2,
      time: '20:25',
      date: DateTime(10, 10, 2020),
      subComments: [],
    ),
    Comment(
      user: User.test_user2,
      cmText: '''
  //   سلام
  //   یه طراحی می خوام که قشنگ چشم نواز و زیبا باشه
  //   حواستون باشه که حتما برای کنار درز ها و لامپ های ما یک آینه تعبیه کنید تا در شب های گرم تابستانی یک هجوم زمستانی را در پیش بگیریم
  //   با تشکر''',
      likeCount: 7,
      dislikeCount: 2,
      time: '20:25',
      date: DateTime(10, 10, 2020),
      subComments: [],
    ),
    Comment(
        user: User.test_user,
        cmText: 'لامپ بسیار زیبا و درخشانیه. خریدش رو پیشنهاد می کنم',
        likeCount: 7,
        dislikeCount: 1,
        time: '22:30',
        date: DateTime(10, 10, 2020),
        subComments: [
          Comment(
            user: User.test_user2,
            cmText: 'زیبا جادار مطمئن مثل امرسان',
            likeCount: 1,
            dislikeCount: 10,
            time: '23:30',
            date: DateTime(10, 10, 2020),
            subComments: [],
          ),
          Comment(
            user: User.test_user2,
            cmText: 'زیبا جادار مطمئن مثل امرسان',
            likeCount: 1,
            dislikeCount: 2,
            time: '23:30',
            date: DateTime(10, 10, 2020),
            subComments: [],
          ),
          Comment(
            user: User.test_user2,
            cmText: 'زیبا جادار مطمئن مثل امرسان',
            likeCount: 1,
            dislikeCount: 4,
            time: '23:30',
            date: DateTime(10, 10, 2020),
            subComments: [],
          ),
          Comment(
            user: User.test_user2,
            cmText: 'زیبا جادار مطمئن مثل امرسان',
            likeCount: 1,
            dislikeCount: 2,
            time: '23:30',
            date: DateTime(10, 10, 2020),
            subComments: [],
          ),
          Comment(
            user: User.test_user2,
            cmText: 'زیبا جادار مطمئن مثل امرسان',
            likeCount: 1,
            dislikeCount: 1,
            time: '23:30',
            date: DateTime(10, 10, 2020),
            subComments: [],
          ),
        ]),
  ];
}
