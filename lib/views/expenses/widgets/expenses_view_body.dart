import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

import 'expenses_list_builder.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel) onDismissed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Welcome to Expenses Tracker!'),
        Expanded(
          child: ExpensesListBuilder(
            onDismissed: onDismissed,
            expenses: expenses,
          ),
        ),
      ],
    );
  }
}
