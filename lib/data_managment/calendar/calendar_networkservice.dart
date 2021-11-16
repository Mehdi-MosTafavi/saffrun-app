import 'package:saffrun_app/data_managment/base_networkservice.dart';

class CalendarNetworkService extends BaseNetworkService {
  getEventFromServer(DateTime date) async {
    var response = await getTemplate('/reserve/get-day-detail/', body: {
      'date': date.year.toString() +
          '-' +
          date.month.toString() +
          '-' +
          date.day.toString()
    });
    print(response);
    if (response != null) {
      return response;
    }
    throw Exception();
  }

  Future<Map<String, dynamic>> getDatesOfServer() async {
    var response = await getTemplate('/reserve/get-busy-dates/');
    if (response != null) {
      return response;
    }
    throw Exception();
  }
}
