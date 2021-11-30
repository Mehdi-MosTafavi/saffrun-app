import 'package:saffrun_app/data_managment/calendar/calendar_networkservice.dart';
import 'package:saffrun_app/models/event/event_model.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';

class CalendarRepository {
  late CalendarNetworkService calendarNetworkService;

  CalendarRepository() {
    calendarNetworkService = CalendarNetworkService();
  }

  Map<DateTime, List<dynamic>> days = {
    DateTime(2021, 11, 7): ['sample event', 66546],
    DateTime(2021, 11, 6): ['sample event', 66546],
    DateTime(2021, 11, 8): ['sample event', 66546],
    DateTime(2021, 11, 15): ['sample event', 66546],
    DateTime(2021, 4, 14): [6, 5, 465, 1, 66546],
    DateTime(2021, 4, 18): [6, 5, 465, 1, 66546],
    DateTime(2021, 4, 19): [6, 5, 465, 1, 66546],
  };

  Future<Map<String, List>> getEventOfDate(DateTime date) async {
    try {
      Map<String, dynamic> response =
          await calendarNetworkService.getEventFromServer(date);
      Map<String, List> data = {
        'event': Event.fromJsonCalendar(response['events']),
        'reserve': Reserve.fromJson(response['reserves'], date)
      };
      print(data);
      return data;
    } catch (e) {
      print(e);
      return {'event': [], 'reserve': []};
    }
  }

  Future<Map<DateTime, List<dynamic>>> getDateOfEvents() async {
    try {
      var response = await calendarNetworkService.getDatesOfServer();
      List<dynamic> dateEvent = response['dates'];
      Map<DateTime, List<dynamic>> dates = <DateTime, List<dynamic>>{};
      dateEvent.forEach((element) {
        List<String> splitedDate = element.split('-');
        dates[DateTime(int.parse(splitedDate[0]), int.parse(splitedDate[1]),
            int.parse(splitedDate[2]))] = [];
      });

      return dates;
    } catch (e) {
      print(e);
      // return days;
      return <DateTime, List<dynamic>>{};
    }
  }
}
