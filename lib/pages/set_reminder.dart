import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class SetReminder extends StatefulWidget {
  const SetReminder({super.key});

  @override
  State<SetReminder> createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {

  TimeOfDay selectedTime = TimeOfDay(hour: 8, minute: 0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: quartenary, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Set Reminder',
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: quartenary,
          ),
        ),
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'When would you like to be reminded?',
                textAlign: TextAlign.center, 
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: dark,
                ),
              ),
              const SizedBox(height: 20), 
              //circle
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(radius: 60, backgroundColor: circle),
                  Positioned(
                    bottom: 10,
                    child: Image.asset(
                      'images/reminder/bell.png',
                      width: 120,
                      height: 115,
                    ),
                  ),
                ],
              ),
              
              // Set time            
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Set time',
                  style: GoogleFonts.sora(
                    fontSize: 15,
                    color: dark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              GestureDetector(
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context, 
                    initialTime: selectedTime, 
                  );
                  if (picked != null && picked != selectedTime) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                  
                },
                child: Container(
                  width: 250,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: primary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          selectedTime.hourOfPeriod.toString().padLeft(2, '0'),
                          style: GoogleFonts.sora(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(':', style: GoogleFonts.sora(fontSize: 16)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          selectedTime.minute.toString().padLeft(2, '0'),
                          style: GoogleFonts.sora(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: tertiary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          selectedTime.period == DayPeriod.am ? 'AM' : 'PM',
                          style: GoogleFonts.sora(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 20),

              // Set date
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Set date',
                  style: GoogleFonts.sora(
                    fontSize: 15,
                    color: dark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Calendar placeholder
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30 ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *0.55,
                  decoration: BoxDecoration(
                    border: Border.all(color: primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: DateTime.now(),
                
                    selectedDayPredicate: (day) {
                      return isSameDay(day, DateTime.now());
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: tertiary,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                      color: secondary,
                      shape: BoxShape.circle,
                    ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      //handle of clicking date
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Set reminder button
              SizedBox(
                width: 229,
                height: 40, // full width
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: details,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'SET REMINDER',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
