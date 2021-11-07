part of 'calendar_cubit.dart';

@immutable
abstract class CalendarState {
  DateTime dateTime;

  CalendarState({required this.dateTime});
}

class CalendarInitial extends CalendarState {
  CalendarInitial() : super(dateTime: DateTime(0, 0, 0));
}

class CalendarLoadingDateEvent extends CalendarState {
  CalendarLoadingDateEvent() : super(dateTime: DateTime(0, 0, 0));
}

class CalendarLoadedDateEvent extends CalendarState {
  Map<DateTime, List<dynamic>> days;

  CalendarLoadedDateEvent(this.days, {DateTime? date})
      : super(dateTime: date ?? DateTime(0, 0, 0));
}

class CalendarSelectDate extends CalendarState {
  CalendarSelectDate(DateTime date) : super(dateTime: date);
}

class CalendarLoadedData extends CalendarState {
  List<Event> events;

  CalendarLoadedData(DateTime date, this.events) : super(dateTime: date);
}

class CalendarErrorData extends CalendarState {
  CalendarErrorData({DateTime? date})
      : super(dateTime: date ?? DateTime(0, 0, 0));
}
