import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesListBuilder extends StatelessWidget {
  const ExpensesListBuilder({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel) onDismissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDismissed(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index].toEntity()),
      ),
    );
  }
}
