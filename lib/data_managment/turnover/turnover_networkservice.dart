import 'package:saffrun_app/data_managment/base_networkservice.dart';

class TurnoverNetworkService extends BaseNetworkService {
  dynamic getTurnoverFromNetworkService() async {
    return await getTemplate('/payment/client/get-all-payment/');
  }

  Future<bool> postPayment(
      int amount, int owner, int modeId, String type) async {
    try {
      dynamic result = await postTemplate('/payment/', {
        'amount': amount,
        'owner': owner,
        'filters': {'mode': type, 'id': modeId}
      });
      print(result);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addWallet(int x) async {
    try {
      dynamic result = await postTemplate(
          '/payment/', {'amount': x, 'is_wallet_invoice': true, 'filters': {}});
      if (result == null) return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
