import 'package:saffrun_app/data_managment/base_networkservice.dart';

class HistoryNetworkService extends BaseNetworkService {
  Future<dynamic> fetchEventFromServer(
      {required int page, required int pageCount}) async {
    return await getTemplate('/event/get-client-reserve-history',
        body: {'page': page, 'page_count': pageCount});
  }

  fetchReserveFromServer({required int page, required int pageCount}) async {
    return await getTemplate('/reserve/get-client-reserve-history',
        body: {'page': page, 'page_count': pageCount});
  }
}
