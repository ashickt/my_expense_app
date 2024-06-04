import 'package:flutter/material.dart';
import 'package:my_expense_app/widgets/common/DataLoading.dart';

import 'package:provider/provider.dart';
import 'package:my_expense_app/providers/summary_provider.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool loading = false;
  int currentBalance = 0;
  String currency = 'BTN';
  int targetedBudget = 0;
  int totalIncome = 0;
  int totalExpense = 0;

  @override
  void initState() {
    getSummary();
  }

  Future<void> getSummary() async {
    try {
      setState(() {
        loading = true;
      });
      // final res = await SummaryProvider().getSummary();
      final ress = Provider.of<SummaryProvider>(context).summary;
      print('checking $ress');
      print('prints at first');
      setState(() {
        currentBalance = ress.openingBalance;
        targetedBudget = ress.totalTransactionThisMonth;
        totalIncome = ress.income;
        totalExpense = ress.expense;
        print('checking $ress');
      });
    } catch (e) {}
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.only(bottom: 16),
      child: loading
          ? Dataloading()
          : Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  color: Colors.deepOrange,
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Balance',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '$currency $currentBalance',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Targeted Budget',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '$currency $targetedBudget',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width - 32,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(4, 6), // Shadow position
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Current Balance'),
                            Text(
                              '$currency $currentBalance',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Targeted Expenses'),
                            Text(
                              '$currency $targetedBudget',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
