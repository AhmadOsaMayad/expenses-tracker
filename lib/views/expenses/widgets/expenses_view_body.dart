import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/expense_view_body_layout_builder.dart';
import 'package:flutter/material.dart';

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
    return ExpenseViewBodyLayoutBuilder(
      expenses: expenses,
      onDismissed: onDismissed,
    );
  }
}
