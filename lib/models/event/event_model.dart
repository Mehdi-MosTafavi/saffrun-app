class Event {
  int id;
  String title;
  String description;
  String imageUrl;
  int discount;
  int ownerId;
  DateTime startTime;
  DateTime finishTime;
  String comments;

  Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.discount,
      required this.ownerId,
      required this.startTime,
      required this.finishTime,
      required this.comments});

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
      comments: '',
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
      comments: '',
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
      comments: '',
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
      comments: '',
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
      comments: '',
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
      comments: '',
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
      comments: '',
    ),
  ];

  static List<Event> fromJson(List<dynamic> response) {
    List<Event> events = [];
    response.forEach((element) {
      events.add(Event(
        id: element['id'] ?? -1,
        title: element['title'],
        description: element['description'],
        imageUrl: element['image'],
        discount: element['discount'],
        startTime: DateTime(2020),
        finishTime: DateTime(2021),
        comments: '',
        ownerId: element['owner'],
      ));
    });
    return events;
  }
}