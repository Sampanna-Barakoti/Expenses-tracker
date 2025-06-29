import 'dart:ffi';

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

  //for remaining balance
  double get remainingBalance => totalIncome - totalExpenses;

  void addTransaction(String title, double amount, bool isIncome) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      isIncome: isIncome,
    );
    _transaction.insert(0, newTransaction);
    notifyListeners();
  }

  //to remove
  void removeTransaction(String id) {
    _transaction.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
