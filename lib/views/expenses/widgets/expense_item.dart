import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(expense.title),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(Icons.alarm, color: Colors.grey[600], size: 16.0),
            ),
            const SizedBox(width: 4.0),
            Text(expense.date.toString()),
          ],
        ),
        trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
