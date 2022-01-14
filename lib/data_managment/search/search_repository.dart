import 'package:saffrun_app/data_managment/search/search_networkservice.dart';
import 'package:saffrun_app/models/event/event_model.dart';

import '../../models/admin/admin_model.dart';

class SearchRepository {
  late SearchNetworkService searchNetworkService;

  SearchRepository() {
    searchNetworkService = SearchNetworkService();
  }

  Future<Map<String, dynamic>> loadEventFromRepository(
      Map<String, dynamic> searchAndFilterProperty, int page) async {
    try {
      Map<String, dynamic> response = await searchNetworkService
          .searchEventFromServer(searchAndFilterProperty, page);
      print(response);
      if (response == null) {
        return {'events': [], 'business': []};
      }
      return {
        'events': Event.fromJsonList(response['events']),
        'business': Admin.fromJsonList(response['businesses'])
      };
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
