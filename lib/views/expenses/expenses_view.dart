import 'package:expenses_tracker/views/expenses/widgets/expenses_view_body.dart';
import 'package:flutter/material.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses Tracker')),
      body: const ExpensesViewBody(),
    );
  }
}
