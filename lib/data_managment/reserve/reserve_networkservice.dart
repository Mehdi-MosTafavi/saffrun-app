import '../base_networkservice.dart';

class ReserveNetworkService extends BaseNetworkService {
  Future<dynamic> getReserveTime(int adminId) async {
    try {
      Map<String, String> body = {"admin_id": adminId.toString()};
      print(body);
      dynamic jsonResponse =
          await getTemplate('/reserve/get-next-seven-days/', body: body);
      print(jsonResponse);
      if (jsonResponse == null) {
        return null;
      }
      return jsonResponse;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
