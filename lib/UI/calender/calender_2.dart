import 'package:flutter/material.dart';
import 'package:saffrun_app/UI/utils/calender/calender_widget.dart';
import 'package:saffrun_app/UI/utils/calender/customization/calendar_style.dart';
import 'package:saffrun_app/UI/utils/calender/customization/days_of_week_style.dart';
import 'package:saffrun_app/UI/utils/calender/customization/header_style.dart';
import 'package:saffrun_app/UI/utils/calender/shared/utils.dart';

class CalenderPage2 extends StatefulWidget {
  const CalenderPage2({Key? key}) : super(key: key);

  @override
  _CalenderPage2State createState() => _CalenderPage2State();
}

class _CalenderPage2State extends State<CalenderPage2> {
  final Set<DateTime> _selectedDays = Set<DateTime>();
  final Set<DateTime> _holidays = Set<DateTime>();

  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final CalendarFormat _calendarFormatWeek = CalendarFormat.month;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      // print(_selectedDays);
      // print(_holidays);
      _selectedDays.clear();
      _focusedDay.value = selectedDay;
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
    });

    // _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2030, 1, 1),
                focusedDay: _focusedDay.value,
                headerVisible: true,
                selectedDayPredicate: (day) => _selectedDays.contains(day),
                onDaySelected: _onDaySelected,
                holidayPredicate: (day) =>
                    _holidays.contains(DateTime.parse(day.toString())),
                headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width * 0.042),
                    titleCentered: true,
                    headerMargin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffEFF0F6)),
                    formatButtonVisible: false),
                daysOfWeekHeight: 50,
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        color: Color(0xffF4B740), fontWeight: FontWeight.w600),
                    weekendStyle: TextStyle(
                        color: Color(0xffF4B740), fontWeight: FontWeight.w600)),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff0096B7)),
                  holidayDecoration: BoxDecoration(
                      border: Border.all(color: Color(0xffF4B740)),
                      borderRadius: BorderRadius.circular(10)),
                  defaultDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  weekendDecoration: BoxDecoration(),
                  selectedDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff6D07CB), Color(0xffEFADFF)]),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Colors.grey),
                  cellMargin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xffEFF0F6),
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: new Text(
                'Upcoming plans',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          // Expanded(child: ValueListenableBuilder<List<Event>>(
          //     valueListenable: _selectedEvents,
          //     builder: (context, value, _) {
          //       var color = [0xffED2E7E,0xff00BA88];
          //       return ListView.builder(
          //
          //           itemCount: value.length,
          //           itemBuilder: (context, index) {
          //             return Directionality(
          //               textDirection: TextDirection.rtl,
          //               child: Container(
          //                 height: 70,
          //                 margin: const EdgeInsets.symmetric(
          //                   horizontal: 12.0,
          //                   vertical: 4.0,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   color: Color(0xffF7F7FC),
          //                   // border: Border.all(),
          //                   borderRadius: BorderRadius.circular(12.0),
          //                 ),
          //                 child: ListTile(
          //                   trailing: Text(value[index].datesave.hour.toString() + ":" + value[index].datesave.minute.toString() +' AM', style: TextStyle(fontWeight: FontWeight.w700,),textDirection: TextDirection.ltr,),
          //                   title: IntrinsicHeight(
          //                     child: Directionality(
          //                       textDirection: TextDirection.ltr,
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         children: [
          //                           VerticalDivider(thickness: 4,color: Color(color[index%2]),width: 20,),
          //                           new SizedBox(width: 4,),
          //                           Column(
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               Text('${value[index]}',style: TextStyle(fontWeight: FontWeight.w600),),
          //                               Text(value[index].Category,style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xffA0A3BD)),),
          //
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             );
          //           }
          //       );
          //     }
          // ))
        ],
      ),
    );
  }

//   _getEventsForDays(Iterable<DateTime> days) {
//   return [
//     for (final d in days) ..._getEventsForDay(d),
//   ];
// }
}
