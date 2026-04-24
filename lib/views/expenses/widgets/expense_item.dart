import 'package:expenses_tracker/views/expenses/entities/expense_entity.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final ExpenseEntity expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(expense.category.icon),
        title: Text(
          expense.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(
                Icons.alarm,
                size: 16.0,
              ), //color: Colors.grey[600], size: 16.0),
            ),
            const SizedBox(width: 4.0),
            Text(expense.formattedDate.toString()),
          ],
        ),
        trailing: Text('\$${expense.formattedAmount}'),
      ),
    );
  }
}
