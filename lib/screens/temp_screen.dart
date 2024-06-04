import 'package:my_expense_app/plugins/local_notifications.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Test')),
        body: Container(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  LocalNotification()
                      .showNotification('hello', 'can you hear me');
                },
                child: Text('Click me')),
          ),
        ));
  }
}
