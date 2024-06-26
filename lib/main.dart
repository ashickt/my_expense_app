import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_expense_app/firebase_options.dart';
import 'package:my_expense_app/plugins/firebase_api.dart';
import 'package:my_expense_app/plugins/local_notifications.dart';
import 'package:my_expense_app/screens/auth/login_screen.dart';
import 'package:my_expense_app/screens/splash_screen.dart';

import 'package:provider/provider.dart';
import 'package:my_expense_app/providers/summary_provider.dart';
// import 'firebase_options.dart';

void main() async {
  // await LocalNotification.initialize();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SummaryProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
