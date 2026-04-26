import 'dart:developer';
import 'package:expenses_tracker/core/constants/app_consts.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/new_expense/new_expense_sheet.dart';
import 'package:flutter/material.dart';
import 'widgets/expenses_view_body.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final List<ExpenseModel> _registeredExpenses = [];
  @override
  void initState() {
    super.initState();
    for (var expn in kDummyExpenses) {
      _registeredExpenses.add(expn);
    }
  }

  void _addNewExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    final sText = S.of(context);
    final scafMsg = ScaffoldMessenger.of(context);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    scafMsg.clearSnackBars();
    scafMsg.showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Text(
          '${sText.theItem} ${expense.title} ${sText.hasBeenDeleted}',
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: sText.undo,
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() async {
    ExpenseModel? expense = await showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      // context: Navigator.of(context, rootNavigator: true).context,
      context: context,
      builder: (ctx) => const NewExpenseSheet(),
    );
    if (expense is ExpenseModel) {
      _addNewExpense(expense);
      log('Expenses View is Here: ${expense.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: SizedBox(
        width: 300,
        child: Text(
          textAlign: TextAlign.center,
          S.of(context).ExpensesListIsEmpty,
        ),
      ),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesViewBody(
        onDismissed: _removeExpense,
        expenses: _registeredExpenses,
      );
    }
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
      body: mainContent,
    );
  }
}
