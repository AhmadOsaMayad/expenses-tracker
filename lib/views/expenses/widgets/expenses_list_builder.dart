import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesListBuilder extends StatelessWidget {
  const ExpensesListBuilder({super.key, required this.expenses});
  final List<ExpenseModel> expenses;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Card(
        child: ListTile(
          title: Text(expenses[index].title),
          subtitle: Text(expenses[index].date.toString()),
          trailing: Text('\$${expenses[index].amount.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
