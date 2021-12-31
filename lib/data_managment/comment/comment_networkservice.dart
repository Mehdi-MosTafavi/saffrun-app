import 'package:saffrun_app/data_managment/base_networkservice.dart';

class CommentNetworkService extends BaseNetworkService {
  dynamic getCommentEvents(int id) async {
    try {
      dynamic result = await getTemplate('/comment/get_event_comments/',
          body: {'event_id': id.toString()});
      print(result);
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> sendCommentEventToServer(int eventid, String text) async {
    try {
      dynamic result = await postTemplate('/comment/save_comment/',
          {'event_id': eventid.toString(), 'content': text});
      if (result == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> sendCommentAdminToServer(int eventid, String text) async {
    try {
      dynamic result = await postTemplate('/comment/save_comment/',
          {'owner_id': eventid.toString(), 'content': text});
      if (result == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  dynamic getCommentAdmin(int i) async {
    try {
      dynamic result = await getTemplate('/comment/get_owner_comments/',
          body: {'admin_id': i.toString()});
      print(result);
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
