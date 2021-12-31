import '../../logical/general/size_function.dart';

class NotificationData {
  int id;
  String title;
  String text;
  int type;
  String url;
  String senderName;
  DateTime createtime;

  NotificationData(
      {required this.id,
      required this.title,
      required this.text,
      required this.type,
      required this.url,
      required this.senderName,
      required this.createtime});

  static List<NotificationData> fromJsonList(List<dynamic> response) {
    List<NotificationData> events = [];
    response.forEach((element) {
      events.add(NotificationData(
        id: element['id'] ?? -1,
        title: element['title'],
        createtime: getTime(element['created_at']),
        text: element['text'],
        senderName: element['sender']['full_name'],
        type: element['type'],
        url: element['url'],
      ));
    });
    return events;
  }
}
