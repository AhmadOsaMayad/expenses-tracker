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
        background: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal - 12,
            vertical: Theme.of(context).cardTheme.margin!.vertical - 6,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error.withAlpha(192),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDismissed(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index].toEntity()),
      ),
    );
  }
}
