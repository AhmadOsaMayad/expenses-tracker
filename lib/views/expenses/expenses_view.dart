import 'dart:developer';

import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/new_expense_sheet.dart';
import 'package:flutter/material.dart';

import 'widgets/expenses_view_body.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      id: uuid.v4(),
      title: 'Pizza Dinner',
      amount: 15.99,
      date: DateTime(2026, 4, 10, 20, 30),
      category: Category.food,
      currency: Currency.usd,
    ),
    ExpenseModel(
      id: uuid.v4(),
      title: 'Flight to Cairo',
      amount: 250.00,
      date: DateTime(2026, 3, 28, 15, 45),
      category: Category.travel,
      currency: Currency.usd,
    ),
    ExpenseModel(
      id: uuid.v4(),
      title: 'Movie Night',
      amount: 12.50,
      date: DateTime(2026, 4, 5, 20, 30),
      category: Category.leisure,
      currency: Currency.usd,
    ),
    ExpenseModel(
      id: uuid.v4(),
      title: 'Laptop Purchase',
      amount: 1200.00,
      date: DateTime.now(), //(2026, 2, 15),
      category: Category.work,
      currency: Currency.usd,
    ),
  ];

  void _addNewExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
      // _registeredExpenses.add(expense.toEntity());
    });
  }

  void _removeExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _openAddExpenseOverlay() async {
    ExpenseModel? expense = await showModalBottomSheet(
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
      body: ExpensesViewBody(
        onDismissed: _removeExpense,
        expenses: _registeredExpenses, //.map((e) => e.toEntity()).toList(),
      ),
    );
  }
}
