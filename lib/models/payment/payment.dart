import 'package:saffrun_app/logical/general/size_function.dart';

import '../event/event_model.dart';
import '../reserve/reserve.dart';

class PaymentData {
  String type;
  int amout;
  DateTime date;
  Event? event;
  Reserve? reserve;

  PaymentData(
      {required this.type,
      required this.date,
      required this.amout,
      this.event,
      this.reserve});

  static List<PaymentData> fromJsonList(List result) {
    List<PaymentData> payments = [];
    for (var element in result) {
      payments.add(PaymentData(
        type: element['type'],
        date: getTime(element['date']),
        amout: element['amount'],
        event: element['type'] == 'رویداد' ? getEvent(element['mode']) : null,
        reserve: element['type'] == 'نوبت' ? getReserve(element['mode']) : null,
      ));
    }
    return payments;
  }

  static getEvent(result) {
    return Event(
      id: result['id'],
      ownerId: result['owner']['id'],
      ownerName: result['owner']['username'] ?? " ",
      startTime: DateTime.now(),
      finishTime: DateTime.now(),
      title: result['title'] ?? " ",
    );
  }

  static getReserve(Map result) {
    return Reserve(
        id: result['id'],
        adminId: result['owner']['id'],
        adminName: result['owner']['username'] ?? " ",
        createdReserve: DateTime.now(),
        targetStartReserve: DateTime.now(),
        targetEndReserve: DateTime.now());
  }
}
