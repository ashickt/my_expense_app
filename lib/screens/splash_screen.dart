import 'package:flutter/material.dart';
import 'package:my_expense_app/base/style/text_style.dart';
import 'package:my_expense_app/hoc/Home_layout.dart';
import 'package:my_expense_app/screens/auth/login_screen.dart';
import 'package:my_expense_app/screens/landing/Home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkIfUserIsLoggedIn();
  }

  Future<void> checkIfUserIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('_TOKEN');
    print('inside method');
    print(token);
    if (token != '') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeLayout()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TypoStyles().kPageHeader,
            ),
            Text(
              'Expense Tracker',
              style: TypoStyles().kPageHeader,
            )
          ],
        ),
      ),
    );
  }
}
