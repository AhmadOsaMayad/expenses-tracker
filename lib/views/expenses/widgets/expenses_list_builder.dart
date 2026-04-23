import 'package:expenses_tracker/views/expenses/entities/expense_entity.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesListBuilder extends StatelessWidget {
  const ExpensesListBuilder({super.key, required this.expenses});
  final List<ExpenseEntity> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expense: expenses[index]),
    );
  }
}
