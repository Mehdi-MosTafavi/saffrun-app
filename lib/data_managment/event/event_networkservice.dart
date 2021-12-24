import 'package:saffrun_app/data_managment/base_networkservice.dart';

class EventNetworkService extends BaseNetworkService {
  dynamic getEventDetailFromServer(int id) async {
    try {
      dynamic result = await getTemplateInLink('/event/get-detail-event/', id);
      if (result == null) {
        throw ('Error');
      }
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addParticipantRequest(int id) async {
    try {
      dynamic result = await postTemplate(
          '/event/add-participants/', {'event_id': id.toString()});
      print(result);
      if (result == null) {
        return false;
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
