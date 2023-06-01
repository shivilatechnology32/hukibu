// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:hukibu/Screen/add_note.dart';
// // import 'package:hukibu/Screen/notes_details.dart';
// // import 'package:velocity_x/velocity_x.dart';
// // class NotesScreen extends StatelessWidget {
// //   const NotesScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         foregroundColor: Colors.black,
// //         elevation: 0,
// //         title: "Notes".text.make(),
// //       ),
// //       body: Column(
// //         children: [
// //           StreamBuilder(
// //               stream: FirebaseFirestore.instance.collection('notes').snapshots(),
// //               builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
// //             if(!snapshot.hasData){
// //               return Expanded(child: CircularProgressIndicator().centered());
// //             }
// //             else if(snapshot.data!.docs.isEmpty){
// //               return Expanded(child: "No Notes".text.bold.size(25).makeCentered());
// //             }
// //             else{
// //               return Expanded(
// //                 child: ListView.builder(
// //                     itemCount: snapshot.data!.docs.length,
// //                     itemBuilder: (context,index){
// //                   return GestureDetector(
// //                     onTap: (){
// //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesDetails(data: snapshot.data!.docs[index])));
// //                     },
// //                     child: ListTile(
// //                       title: "${snapshot.data!.docs[index]['title']}".text.make(),
// //                       leading: Icon(Icons.note,color: Colors.yellow,size: 20,),
// //                     ),
// //                   );
// //                 }),
// //               );
// //             }
// //           })
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: Colors.yellow,
// //           onPressed: (){
// //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNote()));
// //           },
// //         child: const Icon(Icons.add)),
// //     );
// //   }
// // }
//
//
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The app which hosts the home page which contains the calendar on it.
// class CalendarApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(title: 'Calendar Demo', home: MyHomePage());
//   }
// }

/// The hove page which hosts the calendar
class NotesScreen extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const NotesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Meet', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
