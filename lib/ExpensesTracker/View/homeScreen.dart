import 'package:expense_tracker_app/ExpensesTracker/Widgets/add_transaction.dart';
import 'package:expense_tracker_app/ExpensesTracker/Widgets/summary_card.dart';
import 'package:expense_tracker_app/ExpensesTracker/Widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTransaction(),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("Expenses Tracker")),
      body: Column(
        children: [SummaryCard(), Expanded(child: TransactionList())],
      ),
    );
  }
}
