import 'package:expenses_tracker/core/helpers/is_arabic.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/chart.dart';
import 'package:expenses_tracker/views/expenses/widgets/expenses_list_builder.dart';
import 'package:flutter/material.dart';

class ExpenseViewBodyLayoutBuilder extends StatelessWidget {
  const ExpenseViewBodyLayoutBuilder({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel) onDismissed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) => constrains.maxWidth <= 500
          ? PortraitUpLayout(expenses: expenses, onDismissed: onDismissed)
          : UnDecidedLayout(expenses: expenses, onDismissed: onDismissed),
    );
  }
}

class PortraitUpLayout extends StatelessWidget {
  const PortraitUpLayout({
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

class UnDecidedLayout extends StatelessWidget {
  const UnDecidedLayout({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isArabic()) Expanded(child: Chart(expenses: expenses)),
        Expanded(
          child: ExpensesListBuilder(
            onDismissed: onDismissed,
            expenses: expenses,
          ),
        ),
        if (isArabic()) Expanded(child: Chart(expenses: expenses)),
      ],
    );
  }
}
