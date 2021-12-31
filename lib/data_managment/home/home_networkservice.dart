import 'package:saffrun_app/data_managment/base_networkservice.dart';

class HomeNetworkService extends BaseNetworkService {
  dynamic getHomePageFromServer() async {
    return await getTemplate('/core/client/homepage/');
  }
}
