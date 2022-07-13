import 'package:saffrun_app/data_managment/turnover/turnover_networkservice.dart';
import 'package:saffrun_app/models/user/user_2.dart';

import '../../models/payment/payment.dart';

class TurnoverRepository {
  late TurnoverNetworkService turnoverNetworkService;

  TurnoverRepository() {
    turnoverNetworkService = TurnoverNetworkService();
  }

  fetchTurnoverFromRepository() async {
    try {
      dynamic result =
          await turnoverNetworkService.getTurnoverFromNetworkService();
      print(result);
      try {
        UserProfile.userLogin.wallet = result['wallet'];
      } catch (e) {}
      Map<String, dynamic> resultMap = {
        'event_payment': result['event_payment'],
        'reserve_payment': result['reserve_payment'],
        'total_payment': result['total_payment'],
        'chart_date': result['chart_data'],
        'payments': PaymentData.fromJsonList(result['payments'])
      };
      return resultMap;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
