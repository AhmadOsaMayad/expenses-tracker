import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/views/expenses/widgets/new_expense_sheet.dart';
import 'package:flutter/material.dart';

import 'widgets/expenses_view_body.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpenseSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).expensesTracker),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const ExpensesViewBody(),
    );
  }
}
