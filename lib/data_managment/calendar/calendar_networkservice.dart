import 'package:saffrun_app/data_managment/base_networkservice.dart';

class CalendarNetworkService extends BaseNetworkService {
  getEventFromServer(DateTime date) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
