import 'package:saffrun_app/data_managment/base_networkservice.dart';

class SearchNetworkService extends BaseNetworkService {
  Future<dynamic> searchEventFromServer(
      Map<String, String> body, int page) async {
    try {
      print(body);
      dynamic? jsonResponse = await getTemplate('/event/get-all/', body: body);
      if (jsonResponse == null) {
        return null;
      }
      print(jsonResponse);
      return jsonResponse;
    } catch (e) {
      rethrow;
    }
  }
}
