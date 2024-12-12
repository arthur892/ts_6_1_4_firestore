import 'package:flutter/material.dart';
import 'package:ts_6_1_4_firestore/features/calendar/models/calendar_entry.dart';
import 'package:ts_6_1_4_firestore/features/calendar/repositories/firestore_database_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.repository});

  final FirestoreDatabaseCalendar repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: repository.getCalendarEntries(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final List<CalendarEntry> entries = snapshot.data!;

              return ListView.separated(
                  itemBuilder: (context, index) {
                    final entry = entries[index];

                    return ListTile(
                      title: Text(entry.title),
                      subtitle: Text(entry.description),
                      trailing: Text(entry.startDate.toString()),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                  itemCount: entries.length);
            }
            return const Text("Hier sollten Kalendereinträge stehen");
          }),
    );
  }
}
