import 'package:saffrun_app/logical/general/size_function.dart';

import '../../constants/const.dart';
import '../event/event_model.dart';
import '../reserve/reserve.dart';

class PaymentData {
  int id;
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
      required this.id,
      this.reserve});

  static List<PaymentData> fromJsonList(List result) {
    List<PaymentData> payments = [];
    for (var element in result) {
      payments.add(PaymentData(
        id: element['id'],
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
        imageUrls: (result['images'] as List).isEmpty
            ? [DefaultImage]
            : [result['images'][0]['image']['full_size']]);
  }

  static getReserve(Map result) {
    print(result);
    return Reserve(
        id: result['id'],
        adminId: result['owner']['id'],
        adminName: result['owner']['username'] ?? " ",
        createdReserve: DateTime.now(),
        targetStartReserve: DateTime.now(),
        adminImage: result['image']['image'] == null
            ? DefaultImage
            : result['image']['image']['full_size'],
        targetEndReserve: DateTime.now());
  }
}
