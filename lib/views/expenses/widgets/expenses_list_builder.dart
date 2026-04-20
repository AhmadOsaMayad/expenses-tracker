import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesListBuilder extends StatelessWidget {
  const ExpensesListBuilder({super.key, required this.expenses});
  final List<ExpenseModel> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expense: expenses[index]),
    );
  }
}
