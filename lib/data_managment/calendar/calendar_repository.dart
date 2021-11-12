import 'package:saffrun_app/data_managment/calendar/calendar_networkservice.dart';
import 'package:saffrun_app/models/event/event_modle.dart';
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
    if (days.containsKey(date)) {
      await calendarNetworkService.getEventFromServer(date);
      Map<String, List> data = {
        'event': Event.events.sublist(0, 3),
        'reserve': Reserve.reserve[0]
      };
      return data;
    }
    return {};
  }

  Future<Map<DateTime, List<dynamic>>> getDateOfEvents() async {
    return days;
  }
}
