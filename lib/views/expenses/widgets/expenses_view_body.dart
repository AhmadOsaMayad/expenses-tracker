import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

import 'expenses_list_builder.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final List<ExpenseModel> dummyExpenses = [
      ExpenseModel(
        title: 'Pizza Dinner',
        amount: 15.99,
        date: DateTime(2026, 4, 10, 20, 30),
        category: Category.food,
        currency: Currency.usd,
      ),
      ExpenseModel(
        title: 'Flight to Cairo',
        amount: 250.00,
        date: DateTime(2026, 3, 28, 15, 45),
        category: Category.travel,
        currency: Currency.usd,
      ),
      ExpenseModel(
        title: 'Movie Night',
        amount: 12.50,
        date: DateTime(2026, 4, 5, 20, 30),
        category: Category.leisure,
        currency: Currency.usd,
      ),
      ExpenseModel(
        title: 'Laptop Purchase',
        amount: 1200.00,
        date: DateTime.now(), //(2026, 2, 15),
        category: Category.work,
        currency: Currency.usd,
      ),
    ];
    return Column(
      children: [
        const Text('Welcome to Expenses Tracker!'),
        Expanded(child: ExpensesListBuilder(expenses: dummyExpenses)),
      ],
    );
    // CustomScrollView(
    //   slivers: [
    //     const SliverToBoxAdapter(child: Text('Welcome to Expenses Tracker!')),
    //     ExpensesListBuilder(expenses: dummyExpenses),
    //   ],
    // );
  }
}
