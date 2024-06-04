import 'dart:convert';

import 'package:my_expense_app/domain/auth/auth_model.dart';
import 'package:my_expense_app/plugins/http.dart';
import 'package:my_expense_app/plugins/local_shared_preferences.dart';

Future loginWithEmailAndPassword() async {
  final res = await PostRequest('Authorization',
      <String, String>{'username': 'admin@expense.com', 'password': 'admin'});
  await setTokenToLocalStorage(jsonDecode(res.body)['data']['accessToken']);
}

class AuthRepo {
  Future loginWithEmailAndPassword(AuthModel authData) async {
    final res = await PostRequest('authentication',
        {'username': authData.username, 'password': authData.password});

    if (res.statusCode == 401) {
      throw Exception('Username or password is incorrect');
    }

    await setTokenToLocalStorage(jsonDecode(res.body)['data']['accessToken']);
    return res;
  }
}
