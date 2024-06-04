class SummaryModel {
  int expense;
  int income;
  int openingBalance;
  int totalTransactionThisMonth;
  String maxExpense;

  SummaryModel(
      {required this.expense,
      required this.income,
      required this.openingBalance,
      required this.maxExpense,
      required this.totalTransactionThisMonth});

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "expenses": int expense,
        "income": int income,
        "openingBalance": int openingBalance,
        "maxExpense": String maxExpense,
        "totalTransactionsThisMonth": int totalTransactionThisMonth
      } =>
        SummaryModel(
            expense: expense,
            income: income,
            openingBalance: openingBalance,
            maxExpense: maxExpense,
            totalTransactionThisMonth: totalTransactionThisMonth),
      _ => throw const FormatException('Format not supported.'),
    };
  }
}
