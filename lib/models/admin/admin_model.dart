import '../../logical/general/size_function.dart';
import '../comment/comment.dart';
import '../event/event_model.dart';

class Admin {
  int id;
  int ownerId;
  String ownerName;
  String category;
  List<String> imageUrls;
  int followerCount;
  List<Event> events;
  List<CommentData> comments;
  String title;
  DateTime date;
  int workerCount;
  String email;
  String phoneNumber;
  String fullAddress;
  String description;
  double rate;
  int rateCount;
  bool isFollowing;

  Admin(
      {required this.id,
      required this.ownerId,
      required this.ownerName,
      required this.category,
      this.imageUrls = const [],
      this.comments = const [],
      required this.followerCount,
      required this.events,
      required this.title,
      required this.date,
      required this.workerCount,
      required this.email,
      required this.phoneNumber,
      required this.fullAddress,
      required this.description,
      required this.rate,
      required this.isFollowing,
      required this.rateCount});

  static getComments(List<dynamic> json) {
    List<CommentData> listComments = [];
    for (var element in json) {
      listComments.add(CommentData(
          id: element['id'],
          image: "",
          content: element['content'] ?? " ",
          userName: element['user']['name'] ?? " ",
          date: getTime(element['created_at'])));
    }
    return listComments;
  }

  static Admin fromJson(result) {
    return Admin(
        id: result['id'],
        ownerId: result['owner']['id'],
        ownerName: result['owner']['full_name'] ?? " ",
        category: result['category'] == null ? " " : result['category']['name'],
        imageUrls: getImages(result['images']),
        followerCount: result['follower_count'] ?? 0,
        comments: getComments(result['comments']),
        events: getEvents(result['events']),
        title: result['title'] ?? " ",
        isFollowing: result['is_following'],
        date: result['establishment_date'] == null
            ? DateTime(2021, 12, 30)
            : getTime(result['establishment_date']),
        workerCount: result['worker_count'] ?? 0,
        email: result['email'] ?? " ",
        phoneNumber: result['phone_number'] ?? " ",
        fullAddress: result['full_address'] ?? " ",
        description: result['description'] ?? " ",
        rate: result['rate'] ?? 0,
        rateCount: result['rate_count'] ?? 0);
  }

  static getEvents(result) {
    List<Event> listComments = [];
    for (var element in result) {
      listComments.add(Event(
          id: element['id'],
          title: element['title'] ?? " ",
          startTime: getTime(element['start_datetime']),
          finishTime: getTime(element['end_datetime']),
          category: element['category']['title'] ?? " ",
          ownerId: element['owner']['id'] ?? 0));
    }
    return listComments;
  }

  static getImages(result) {
    List<String> listString = [];
    for (var element in result) {
      listString.add(element['image']['full_size']);
    }
    return listString;
  }
}
