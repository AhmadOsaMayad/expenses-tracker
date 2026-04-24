import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/chart.dart';
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
        // Text(
        //   'Welcome to Expenses Tracker!',
        //   style: Theme.of(context).textTheme.titleLarge,
        // ),
        Chart(expenses: expenses),
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
