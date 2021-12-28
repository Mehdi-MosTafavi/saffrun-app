import 'package:saffrun_app/data_managment/history/history_networkserivce.dart';

import '../../models/event/event_model.dart';
import '../../models/reserve/reserve.dart';

class HistoryRepository {
  late HistoryNetworkService historyNetworkService;

  HistoryRepository() {
    historyNetworkService = HistoryNetworkService();
  }

  Future<List<Event>> fetchEventFromRepository() async {
    try {
      dynamic result = await historyNetworkService.fetchEventFromServer(
          page: 1, pageCount: 20);
      if (result == null) {
        return [];
      }
      return Event.fromJsonForHistory(result['reserves']);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Reserve>> fetchReserveFromRepository() async {
    try {
      dynamic result = await historyNetworkService.fetchReserveFromServer(
          page: 1, pageCount: 20);
      if (result == null) {
        return [];
      }
      return Reserve.fromJsonForHistory(result['reserves']);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
