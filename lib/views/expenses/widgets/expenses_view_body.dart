import 'package:expenses_tracker/views/expenses/entities/expense_entity.dart';
import 'package:flutter/material.dart';

import 'expenses_list_builder.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key, required this.expenses});
  final List<ExpenseEntity> expenses;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Welcome to Expenses Tracker!'),
        Expanded(child: ExpensesListBuilder(expenses: expenses)),
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
