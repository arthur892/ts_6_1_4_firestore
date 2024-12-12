import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ts_6_1_4_firestore/app.dart';
import 'package:ts_6_1_4_firestore/features/calendar/repositories/firestore_database_calendar.dart';
import 'package:ts_6_1_4_firestore/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final instance = FirebaseFirestore.instance;

  final repository = FirestoreDatabaseCalendar(instance: instance);

  runApp(App(
    repository: repository,
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void users() async {
    // CollectionReference<Map<String, dynamic>> userReference =
    //     firestore.collection("users");
    // final QuerySnapshot<Map<String, dynamic>> userSnapshot =
    //     await userReference.get();
    // print(userSnapshot.toString());

    // final user = userSnapshot.docs;
    // print(user.length);
    // print(user);
  }

  void printUsers() async {
    final QuerySnapshot<Map<String, dynamic>> userSnapshot =
        await firestore.collection("users").get();
    for (final user in userSnapshot.docs) {
      final Map<String, dynamic> data = user.data();
      print(data);
      final userName = data['name'];
      print(userName);
    }
  }

  void printCalendar() async {
    final calendarSnapshot = await firestore.collection('calendar').get();
    firestore.collection('calendar').doc;

    for (var docs in calendarSnapshot.docs) {
      print(docs.data());
    }
  }

  @override
  void initState() {
    users();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              const Text(""),
              ElevatedButton(
                  onPressed: printUsers, child: const Text("Print users")),
              ElevatedButton(
                  onPressed: printCalendar, child: const Text("Print calendar"))
            ],
          )),
    );
  }
}
