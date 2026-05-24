import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/models/expense_bucket_model.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/chart_bar.dart';
import 'package:expenses_tracker/views/expenses/widgets/chart_button.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  //gets List of buckets. Each bucket contains expenses of a specific category.
  List<ExpenseBucketModel> get buckets {
    if (expenses.isEmpty) return [];
    return _getBucketList(expenses);
  }

  //gets the highest bucket total expense.
  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final primary = colorScheme.primary;
    final secondary = colorScheme.secondary;
    final sortedBuckets = buckets.toList()
      ..sort((a, b) => b.totalExpenses.compareTo(a.totalExpenses));
    final nonEmptyBuckets = sortedBuckets
        .where((bucket) => bucket.expenses.isNotEmpty)
        .toList();
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: _chartBox(primary),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in nonEmptyBuckets)
                    ChartBar(fill: _chartBarFill(bucket)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: nonEmptyBuckets
                  .map(
                    (bucket)
                    // if (bucket.expenses.isNotEmpty) {
                    => SizedBox(
                      width: 40,
                      child: ChartButton(
                        iconData: bucket.category.icon,
                        secondary: secondary,
                        primary: primary,
                      ),
                    ),
                    // }
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  double _chartBarFill(ExpenseBucketModel bucket) {
    final max = maxTotalExpense;
    if (max <= 0) return 0.0;
    return bucket.totalExpenses / max;
  }

  BoxDecoration _chartBox(Color color) => BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    gradient: LinearGradient(
      colors: [color.withAlpha(77), color.withAlpha(255)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );
}

List<ExpenseBucketModel> _getBucketList(List<ExpenseModel> expenses) => Category
    .values
    .map((category) => ExpenseBucketModel.forCategory(expenses, category))
    .toList();
