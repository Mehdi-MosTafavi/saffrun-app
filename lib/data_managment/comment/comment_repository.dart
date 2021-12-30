import 'package:saffrun_app/data_managment/comment/comment_networkservice.dart';
import 'package:saffrun_app/models/comment/comment.dart';

class CommentRepository {
  late CommentNetworkService commentNetworkService;

  CommentRepository() {
    commentNetworkService = CommentNetworkService();
  }

  Future<List<CommentData>> fetchCommentPageEvent(int id) async {
    try {
      dynamic comments = await commentNetworkService.getCommentEvents(id);
      if (comments == null) return [];

      return CommentData.fromJsonList(comments["comments"]);
    } catch (e) {
      rethrow;
    }
  }
}
