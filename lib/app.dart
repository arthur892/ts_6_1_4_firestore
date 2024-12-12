import 'package:flutter/material.dart';
import 'package:ts_6_1_4_firestore/features/calendar/home_screen.dart';
import 'package:ts_6_1_4_firestore/features/calendar/repositories/firestore_database_calendar.dart';

class App extends StatelessWidget {
  const App({super.key, required this.repository});
  final FirestoreDatabaseCalendar repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: HomeScreen(repository: repository),
    );
  }
}
