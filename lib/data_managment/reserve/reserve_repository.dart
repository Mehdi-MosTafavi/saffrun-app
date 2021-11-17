import 'package:saffrun_app/data_managment/reserve/reserve_networkservice.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';

class ReserveRepository {
  late ReserveNetworkService reserveNetworkService;

  ReserveRepository() {
    reserveNetworkService = ReserveNetworkService();
  }

  Future<Map<String, dynamic>> getTimesForReserve() async {
    // await Future.delayed(Duration(seconds: 1));
    // await reserveNetworkService.getReserveTime()
    return {'nearest': Reserve.reserve[0][0], 'list_reserve': Reserve.reserve};
  }
}
