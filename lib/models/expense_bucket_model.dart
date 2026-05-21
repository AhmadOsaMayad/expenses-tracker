import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/models/expense_model.dart';

class ExpenseBucketModel {
  final Category category;
  final List<ExpenseModel> expenses;

  const ExpenseBucketModel({required this.category, required this.expenses});

  ExpenseBucketModel.forCategory(List<ExpenseModel> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
