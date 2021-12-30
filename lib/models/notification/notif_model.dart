class Notification_card {
  int id;
  String title;
  String description;
  String imageUrl;
  int discount;
  int ownerId;
  DateTime startTime;
  DateTime finishTime;
  String comments;
  String ownerName;
  int status;
  int participant;

  Notification_card(
      {required this.id,
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.discount,
        required this.ownerId,
        required this.startTime,
        required this.finishTime,
        required this.comments,
        this.ownerName = "",
        required this.participant,
        required this.status});

  static List<Notification_card> events = [
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 1,
      participant: 10,
    ),
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 2,
      participant: 10,
    ),
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 3,
      participant: 10,
    ),
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 1,
      participant: 10,
    ),
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 2,
      participant: 10,
    ),
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 3,
      participant: 10,
    ),
    Notification_card(
      id: 1,
      title: 'بازی مافیا',
      description: 'برگزاری بازی مافیا به صورت گروهی به همراه جایزه',
      imageUrl: '',
      discount: 10,
      ownerId: 2,
      startTime: DateTime(2020),
      finishTime: DateTime(2021),
      comments: '',
      status: 1,
      participant: 10,
    ),
  ];

  static List<Notification_card> fromJson(List<dynamic> response) {
    List<Notification_card> events = [];
    response.forEach((element) {
      events.add(Notification_card(
          id: element['id'] ?? -1,
          title: element['title'],
          description: element['description'],
          imageUrl: element['image'] ?? "",
          discount: element['discount'] ?? 0,
          startTime: DateTime(2020),
          finishTime: DateTime(2021),
          comments: '',
          ownerId: element['owner'] ?? 0,
          ownerName: 'کافه رخ',
          participant: 10,
          status: 1));
    });
    return events;
  }

  static fromJsonCalendar(response) {
    List<Notification_card> events = [];
    response.forEach((element) {
      events.add(Notification_card(
          id: element['id'] ?? -1,
          title: element['title'],
          description: element['description'],
          imageUrl: element['image'] ?? "",
          discount: element['discount'] ?? 0,
          startTime: DateTime(2020),
          finishTime: DateTime(2021),
          comments: '',
          ownerId: element['owner']['id'] ?? -1,
          ownerName: element['owner']['username'],
          participant: 10,
          status: 1));
    });
    return events;
  }
}