import 'package:saffrun_app/data_managment/notification/notification_networkservice.dart';

import '../../models/notification/notif_model.dart';

class NotificationRepository {
  late NotificationNetworkService _notificationNetworkService;

  NotificationRepository() {
    _notificationNetworkService = NotificationNetworkService();
  }

  Future<List<NotificationData>> getNotificationUser() async {
    try {
      dynamic result =
          await _notificationNetworkService.getNotificationFromServer();
      return NotificationData.fromJsonList(result['notifications']);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
