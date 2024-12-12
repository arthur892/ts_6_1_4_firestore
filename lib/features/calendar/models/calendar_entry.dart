import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ts_6_1_4_firestore/features/calendar/models/participant.dart';

class CalendarEntry {
  final String title;
  final String description;
  final DateTime startDate;
  final List<Participant>? participants;

  CalendarEntry({
    required this.title,
    required this.description,
    required this.startDate,
    required this.participants,
  });

  factory CalendarEntry.fromMap(
      Map<String, dynamic> data, List<Participant> participants) {
    // DateTime startDate;
    // if (data["startDate"] != null) {
    //   startDate = DateTime.parse(data["startDate"]);
    // }
    Timestamp t = data["startDate"];
    DateTime myStartDate = t.toDate();

    return CalendarEntry(
        title: data["title"] ?? "Not in Database",
        description: data["description"] ?? "Not in Database",
        startDate: myStartDate,
        participants: participants);
  }
  @override
  String toString() {
    return title;
  }
}
