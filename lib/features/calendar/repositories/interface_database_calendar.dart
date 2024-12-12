import 'package:ts_6_1_4_firestore/features/calendar/models/calendar_entry.dart';
import 'package:ts_6_1_4_firestore/features/calendar/models/participant.dart';

abstract class InterfaceDatabaseCalendar {
  Future<List<CalendarEntry>> getCalendarEntries();
  Future<List<Participant>> getParticipants(String id);
}
