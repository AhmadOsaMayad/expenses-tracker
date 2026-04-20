import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/expenses_list_builder.dart';
import 'package:flutter/material.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final List<ExpenseModel> dummyExpenses = [
      ExpenseModel(
        title: 'Pizza Dinner',
        amount: 15.99,
        date: DateTime(2026, 4, 10),
        category: Category.food,
      ),
      ExpenseModel(
        title: 'Flight to Cairo',
        amount: 250.00,
        date: DateTime(2026, 3, 28),
        category: Category.travel,
      ),
      ExpenseModel(
        title: 'Movie Night',
        amount: 12.50,
        date: DateTime(2026, 4, 5),
        category: Category.leisure,
      ),
      ExpenseModel(
        title: 'Laptop Purchase',
        amount: 1200.00,
        date: DateTime(2026, 2, 15),
        category: Category.work,
      ),
    ];
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: Text('Welcome to Expenses Tracker!')),
        ExpensesListBuilder(expenses: dummyExpenses),
      ],
    );
  }
}
