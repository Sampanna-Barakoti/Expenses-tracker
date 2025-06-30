import 'package:expense_tracker_app/ExpensesTracker/Provider/transaction_provier.dart';
import 'package:expense_tracker_app/ExpensesTracker/View/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 213, 61),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Homescreen(),
      ),
    );
  }
}
