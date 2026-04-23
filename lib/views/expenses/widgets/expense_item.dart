import 'package:expenses_tracker/views/expenses/entities/expense_entity.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  // final ExpenseModel expense;
  final ExpenseEntity expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(expense.category.icon),
        title: Text(expense.title),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(Icons.alarm, color: Colors.grey[600], size: 16.0),
            ),
            const SizedBox(width: 4.0),
            Text(expense.formattedDate.toString()),
            // Text(expense.toEntity().formattedDate.toString()),
          ],
        ),
        trailing: Text('\$${expense.formattedAmount}'),
      ),
    );
  }
}
