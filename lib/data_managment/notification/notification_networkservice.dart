import 'package:saffrun_app/data_managment/base_networkservice.dart';

class NotificationNetworkService extends BaseNetworkService {
  getNotificationFromServer() async {
    try {
      print('ddsgdfgd');
      dynamic result = await getTemplate(
          '/notification/client/get-notifications/',
          body: {'page': 1, 'page_count': 10});
      print('----------------');
      print(result);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
