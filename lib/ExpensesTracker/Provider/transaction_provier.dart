import 'package:expense_tracker_app/ExpensesTracker/Model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvier with ChangeNotifier {
  final List<Transaction> _transaction = [];

  List<Transaction> get transaction => _transaction;

  // for calculating total income
  double get totalIncome => _transaction
      .where((tx) => tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);

  // for calculating total expenses
  double get totalExpenses => _transaction
      .where((tx) => !tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);

  double get remainingBalance => totalIncome - totalExpenses;
}
