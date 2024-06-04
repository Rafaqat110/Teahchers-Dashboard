import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teachers_dashboard/screens/navigation.dart';

import 'dashboard.dart';
import 'screens/login_signup.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCga-KxIr2wqiAg0TmrDR3jl3DvQl1JtMQ',
        appId: '1:465589917461:android:15dc8e596f572debad3b1c',
        messagingSenderId: '465589917461',
        projectId: 'teachers-dashboard-9690d',
      ),
  );
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(

        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
            ),
            home: LoginSignupScreen(

            ),
          );
        }
    );
  }
}
