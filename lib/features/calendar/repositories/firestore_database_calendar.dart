import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ts_6_1_4_firestore/features/calendar/models/calendar_entry.dart';
import 'package:ts_6_1_4_firestore/features/calendar/models/participant.dart';
import 'package:ts_6_1_4_firestore/features/calendar/repositories/interface_database_calendar.dart';

class FirestoreDatabaseCalendar implements InterfaceDatabaseCalendar {
  final FirebaseFirestore instance;

  final keyCalendar = "calendar";
  final keyParticipants = "participants";

  FirestoreDatabaseCalendar({required this.instance});

  @override
  Future<List<CalendarEntry>> getCalendarEntries() async {
    ///Hole die Daten die in der Sammlung 'Calendar stehen
    final QuerySnapshot<Map<String, dynamic>> documents =
        await instance.collection(keyCalendar).get();

    final List<CalendarEntry> entries = [];

    if (documents.docs.isNotEmpty) {
      //Durchsuche jedes Dokument und konvertiere es ins Objekt CalendarEntry
      for (final docs in documents.docs) {
        final Map<String, dynamic> data = docs.data();

        List<Participant> partipants = await getParticipants(docs.id);
        dev.log(partipants.toString());

        final CalendarEntry calendarEntry =
            CalendarEntry.fromMap(data, partipants);
        dev.log(calendarEntry.toString());
        entries.add(calendarEntry);
      }
    }

    return entries;
  }

  @override
  Future<List<Participant>> getParticipants(String id) async {
    final documents = await instance
        .collection(keyCalendar)
        .doc(id)
        .collection(keyParticipants)
        .get();
    List<Participant> participants = [];

    if (documents.docs.isNotEmpty) {
      for (final docs in documents.docs) {
        final Map<String, dynamic> data = docs.data();
        final Participant participant = Participant.fromMap(data);
        participants.add(participant);
      }
    }

    return participants;
  }
}
