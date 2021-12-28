import 'package:saffrun_app/data_managment/notification/notification_networkservice.dart';

class NotificationRepository {
  late NotificationNetworkService _notificationNetworkService;

  NotificationRepository() {
    _notificationNetworkService = NotificationNetworkService();
  }

  Future<List> getNotificationUser() async {
    try {
      await _notificationNetworkService.getNotificationFromServer();
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
