import 'package:my_expense_app/base/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:my_expense_app/widgets/accountList.dart';
import 'package:my_expense_app/widgets/header/header.dart';
import 'package:my_expense_app/widgets/summary.dart';
import 'package:my_expense_app/widgets/transactionList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logoutUser() async {
    print('inside');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('_TOKEN', '');
    print('inside');
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Header(),
        Summary(),
        AccountList(),
        Transactionlist(),
        // ElevatedButton(
        //     onPressed: () {
        //       logoutUser();
        //     },
        //     child: Text('Logout'))
      ],
    )
        // child: Column(
        //   children: [
        //     Text('home page'),
        //     Center(
        //       child: Text(
        //         'Home',
        //         style: TypoStyles().kPageHeader,
        //       ),
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           logoutUser();
        //         },
        //         child: Text('Logout'))
        //   ],
        // ),
        );
  }
}
