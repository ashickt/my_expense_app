import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_expense_app/models/summary_model.dart';

import 'package:http/http.dart' as http;
import 'package:my_expense_app/plugins/http.dart';

class SummaryProvider extends ChangeNotifier {
  SummaryModel _summary = SummaryModel(
      expense: 1200,
      income: 0,
      openingBalance: -1200,
      maxExpense: "Dinner at Restaurant",
      totalTransactionThisMonth: 0);

  SummaryModel get summary => _summary;

  Future getSummary() async {
    final res = await GetRequest('summary');

    _summary = jsonDecode(res.body);

    print('summary --- $summary');
  }
}
