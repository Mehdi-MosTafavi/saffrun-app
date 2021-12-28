import '../../models/event/event_model.dart';
import 'event_networkservice.dart';

class EventRepository {
  late EventNetworkService eventNetworkService;

  EventRepository() {
    eventNetworkService = EventNetworkService();
  }

  Future<Event> fetchEvent(int id) async {
    try {
      Map<String, dynamic> json =
          await eventNetworkService.getEventDetailFromServer(id);

      return Event.fromJson(json);
      // return Event.events[0];
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
