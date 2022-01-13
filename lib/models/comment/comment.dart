import 'package:saffrun_app/constants/const.dart';
import 'package:saffrun_app/logical/general/size_function.dart';

class CommentData {
  int id;
  String content;
  String userName;
  DateTime date;
  String image;
  CommentData? reply;

  CommentData({required this.id,
    required this.content,
    required this.userName,
    required this.date,
    required this.image,
    this.reply});

  static List<CommentData> fromJsonList(List<dynamic> comments) {
    List<CommentData> listComments = [];
    for (Map element in comments) {
      if (element["reply"] != null) {
        listComments.add(CommentData(
            image: element['reply']['image']['image'] == null
                ? DefaultImage
                : element['reply']['image']['image']['thumbnail'],
            id: element['id'],
            content: element['content'],
            userName: element['user']['name'],
            reply: CommentData(
                image: element['reply']['image']['image'] == null
                    ? DefaultImage
                    : element['reply']['image']['image']['thumbnail'],
                id: element['reply']['id'],
                date: getTime(element['reply']['time']),
                content: element['reply']['content'],
                userName: element['reply']['owner']),
            date: getTime(element['created_at'])));
      } else {
        listComments.add(CommentData(
            image: element['user']['image']['image'] == null
                ? DefaultImage
                : element['user']['image']['image']['thumbnail'],
            id: element['id'],
            content: element['content'],
            userName: element['user']['name'],
            date: getTime(element['created_at'])));
      }
    }
    return listComments;
  }
}
