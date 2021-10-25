import 'package:saffrun_app/data_managment/search/search_networkservice.dart';
import 'package:saffrun_app/models/event/event_modle.dart';

class SearchRepository {
  late SearchNetworkService searchNetworkService;

  SearchRepository() {
    searchNetworkService = SearchNetworkService();
  }

  Future<List<Event>> loadEventFromRepository(String value, int page) async {
    try {
      await searchNetworkService.searchEventFromServer(value, page);
      await Future.delayed(const Duration(seconds: 2));
      return Event.events;
    } catch (e) {
      rethrow;
    }
  }
}
