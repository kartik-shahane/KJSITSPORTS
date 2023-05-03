// ignore_for_file: prefer_final_fields, avoid_print

import 'package:fire_auth/UI/auth/posts/event.dart';
import 'package:fire_auth/user_credential.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: duplicate_import
import 'event.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Events');
  final eventsController = TextEditingController();
  final editController = TextEditingController();

  
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Calender and events ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              // ignore: no_leading_underscores_for_local_identifiers
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
      
              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
      
              eventLoader: _getEventsfromDay,
      
              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: const TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Text(
                  event.title,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: globaladmin
          ? 
           FloatingActionButton.extended(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: globaladmin ? const Text("Add Event") : Container(),
                  content: globaladmin
                      ? TextFormField(
                          controller: _eventController,
                        )
                      : Container(),
                  // TextFormField(
                  //   controller: _eventController,
                  // ),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("Ok"),
                      onPressed: () {
                        if (_eventController.text.isEmpty) {
                        } else {
                          if (selectedEvents[selectedDay] != null) {
                            selectedEvents[selectedDay]?.add(
                              Event(title: _eventController.text),
                            );
                          } else {
                            selectedEvents[selectedDay] = [
                              Event(title: _eventController.text)
                            ];
                          }
                        }
                         Navigator.pop(context);
                         _eventController.clear();
                         setState(() {});
                        return;
                      },
                    ),
                  ],
                ),
              ),
              //label: globaladmin ? const Text("Add Event") : Container(),
              label:const Text("Add Event"),
              icon: const Icon(Icons.add)
            ):Container(),
    );
  }
}
