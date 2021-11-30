import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saffrun_app/UI/admin/admin_page.dart';
import 'package:saffrun_app/UI/search/components/event_card.dart';
import 'package:saffrun_app/UI/utils/calender/shared/utils.dart';
import 'package:saffrun_app/UI/utils/table_calender/jalali_table_calendar.dart';
import 'package:saffrun_app/state_managment/calender/calendar_cubit.dart';
import 'package:saffrun_app/state_managment/calender/components/reserve_card.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  late Map<DateTime, List<dynamic>> days;
  final Set<DateTime> _selectedDays = Set<DateTime>();
  final Set<DateTime> _holidays = Set<DateTime>();
  late BuildContext contextCubit;
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
    return BlocProvider(
      create: (context) => CalendarCubit(),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<CalendarCubit>(contextCubit)
                .emit(CalendarInitial());
          },
          child: BlocBuilder<CalendarCubit, CalendarState>(
            builder: (context, state) {
              contextCubit = context;
              if (state is CalendarInitial) {
                BlocProvider.of<CalendarCubit>(context).initCalendar();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CalendarLoadingDateEvent) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CalendarLoadedDateEvent) {
                days = state.days;
                DateTime now = DateTime.now();
                BlocProvider.of<CalendarCubit>(context)
                    .selectDate(DateTime(now.year, now.month, now.day));
              }
              return ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  jalaliCalendar(
                      context: context,
                      // add the events for each day
                      events: days,
                      //make marker for every day that have some events
                      marker: (date, events) {
                        // return Positioned(
                        //   top: -4,
                        //   left: 0,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         color: Theme.of(context).textSelectionColor,
                        //         shape: BoxShape.circle),
                        //     padding: const EdgeInsets.all(6.0),
                        //     child: Text(events.length.toString()),
                        //   ),
                        // );
                        return Container();
                      },
                      onDaySelected: (date) {
                        if (!(state is CalendarInitial ||
                            state is CalendarLoadingDateEvent)) {
                          BlocProvider.of<CalendarCubit>(context)
                              .selectDate(date);
                        }
                      }),
                  const Divider(
                    color: Color(0xffEFF0F6),
                    thickness: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'رویداد های امروز',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  if (state is CalendarLoadedData)
                    state.events.length == 0
                        ? Center(child: Text("هیچ رویدادی یافت نشد"))
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return EventCardWidget(
                                event: state.events[index],
                              );
                            },
                            itemCount: state.events.length,
                          ),
                  if (state is CalendarSelectDate)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  const Divider(
                    color: Color(0xffEFF0F6),
                    thickness: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'نوبت های امروز',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  if (state is CalendarLoadedData)
                    state.events.length == 0
                        ? Center(child: Text("هیچ نوبتی یافت نشد"))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(bottom: 60),
                            itemBuilder: (context, index) {
                              print(state.reserves.length);
                              return ReserveCard(
                                onTapCard: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const AdminPage()));
                                },
                          reserve: state.reserves[index],
                        );
                      },
                      itemCount: state.reserves.length,
                    ),
                  if (state is CalendarSelectDate)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

//   _getEventsForDays(Iterable<DateTime> days) {
//   return [
//     for (final d in days) ..._getEventsForDay(d),
//   ];
// }
}
