import 'package:saffrun_app/models/comment/comment.dart';

import '../../logical/general/size_function.dart';

class Event {
  int id;
  String title;
  String description;
  String imageUrl;
  String category;
  List<String> imageUrls;
  int discount;
  int ownerId;
  DateTime startTime;
  DateTime finishTime;
  List<CommentData> comments;
  String ownerName;
  int participantCount;
  bool isParticipate;
  int price;
  String status;

  Event(
      {required this.id,
      required this.title,
      this.description = "",
      this.imageUrl = "",
      this.discount = 0,
      required this.ownerId,
      required this.startTime,
      required this.finishTime,
      this.comments = const [],
      this.ownerName = "",
      this.category = "",
      this.imageUrls = const [],
      this.isParticipate = false,
      this.price = 0,
      this.status = "",
      this.participantCount = 0});

  static List<Event> events = [
    Event(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: [],
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
      comments: [],
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
      comments: [],
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
      comments: [],
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
      comments: [],
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
      comments: [],
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
      comments: [],
    ),
  ];

  static List<Event> fromJsonList(List<dynamic> response) {
    List<Event> events = [];
    response.forEach((element) {
      events.add(Event(
          id: element['id'] ?? -1,
          title: element['title'],
          description: element['description'],
          imageUrl: element['image'] ?? "",
          discount: element['discount'] ?? 0,
          startTime: DateTime(2020),
          finishTime: DateTime(2021),
          comments: [],
          ownerId: element['owner']['id'] ?? 0,
          ownerName: element['owner']['title']));
    });
    return events;
  }

  static fromJsonCalendar(response) {
    List<Event> events = [];
    response.forEach((element) {
      events.add(Event(
          id: element['id'] ?? -1,
          title: element['title'],
          description: element['description'],
          imageUrl: element['image'] ?? "",
          discount: element['discount'] ?? 0,
          startTime: DateTime(2020),
          finishTime: DateTime(2021),
          comments: [],
          ownerId: element['owner']['id'] ?? -1,
          ownerName: element['owner']['username']));
    });
    return events;
  }

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: "",
        imageUrls: getImages(json['images']),
        category: json['category']['title'],
        discount: json['discount'] ?? 0,
        ownerId: json['owner']['id'] ?? 0,
        participantCount: json["participants"],
        ownerName: json['owner']['title'] ?? "",
        startTime: getTime(json['start_datetime']),
        finishTime: getTime(json['end_datetime']),
        isParticipate: json["is_participate"],
        comments: getComments(json['comments']));
  }

  static getComments(List<dynamic> json) {
    List<CommentData> listComments = [];
    for (var element in json) {
      listComments.add(CommentData(
          id: element['id'],
          image: "",
          content: element['text'],
          userName: element['name'] ?? "",
          date: getTime(element['date'])));
    }
    return listComments;
  }

  static List<Event> fromJsonForHistory(List result) {
    List<Event> events = [];
    for (Map event in result) {
      events.add(Event(
          id: event['id'],
          title: event['title'],
          startTime: getTime(event['start_datetime']),
          ownerId: event['owner']['id'],
          finishTime: getTime(event['end_datetime']),
          ownerName: event['owner']['full_name'] ?? " ",
          price: event['price'],
          status: event['status'],
          imageUrls: (event['images'] as List).isEmpty
              ? []
              : [event['images'][0]['image']['full_size']],
          participantCount: event['participant_count']));
    }
    return events;
  }

  static List<Event> fromJsonListEvents(List result) {
    List<Event> events = [];
    for (Map event in result) {
      events.add(Event(
          id: event['id'],
          title: event['title'],
          startTime: getTime(event['start_datetime']),
          description: event['description'],
          finishTime: getTime(event['end_datetime']),
          ownerName: event['owner_name'] ?? " ",
          ownerId: 0));
    }
    return events;
  }

  static getImages(result) {
    List<String> listString = [];
    for (var element in result) {
      listString.add(element['image']['full_size']);
    }
    return listString;
  }
/*I/flutter ( 4258): {id: 1, title: قهوه با رفقا, description: قهوه بزنیم با هم داوشیا, discount: 0, participants: 3, start_datetime: 2021-11-25T15:54:26+03:30, end_datetime: 2021-11-25T18:54:29+03:30, category: {id: 1, title: سرگرمی}, images: []}

   */
}
