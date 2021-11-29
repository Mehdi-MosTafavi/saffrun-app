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

  Future<bool> sendReserveId(int id) async {
    try {
      dynamic response =
          await postTemplate('/reserve/reserve-employee/', {"reserve_id": id});
      if (response == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
