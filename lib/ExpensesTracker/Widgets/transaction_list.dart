import 'package:expense_tracker_app/ExpensesTracker/Provider/transaction_provier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvier>(context);
    return ListView.builder(
      itemCount: transactionProvider.transaction.length,

      itemBuilder: (context, index) {
        final tx = transactionProvider.transaction[index];
        return GestureDetector(
          onLongPress: () {
            transactionProvider.removeTransaction(tx.id);
          },
          child: ListTile(
            title: Text(tx.title),
            subtitle: Text(tx.date.toString()),
            trailing: Text(
              '\$${tx.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: tx.isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
