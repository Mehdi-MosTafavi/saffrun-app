import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/notification/notification_repository.dart';

import '../../models/notification/notif_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  late NotificationRepository notificationRepository;

  NotificationCubit() : super(NotificationInitial()) {
    notificationRepository = NotificationRepository();
  }

  Future<void> fetchNotificationPage() async {
    emit(NotificationLoading());
    try {
      List<NotificationData> notfis =
          await notificationRepository.getNotificationUser();
      emit(NotificationLoaded(notfis));
    } catch (e) {
      emit(NotificationError());
    }
  }
}
