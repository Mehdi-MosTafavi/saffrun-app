import 'package:saffrun_app/data_managment/search/search_networkservice.dart';
import 'package:saffrun_app/models/event/event_model.dart';

class SearchRepository {
  late SearchNetworkService searchNetworkService;

  SearchRepository() {
    searchNetworkService = SearchNetworkService();
  }

  Future<List<Event>> loadEventFromRepository(
      Map<String, String> searchAndFilterProperty, int page) async {
    try {
      Map<String, dynamic> response = await searchNetworkService
          .searchEventFromServer(searchAndFilterProperty, page);
      if (response == null) {
        return [];
      }
      return Event.fromJson(response['events']);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
