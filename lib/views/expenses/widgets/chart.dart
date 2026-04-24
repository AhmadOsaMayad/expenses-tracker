import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/models/expense_bucket_model.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/expenses/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  List<ExpenseBucketModel> get buckets {
    return [
      ExpenseBucketModel.forCategory(expenses, Category.food),
      ExpenseBucketModel.forCategory(expenses, Category.leisure),
      ExpenseBucketModel.forCategory(expenses, Category.travel),
      ExpenseBucketModel.forCategory(expenses, Category.bills),
      ExpenseBucketModel.forCategory(expenses, Category.deposits),
      ExpenseBucketModel.forCategory(expenses, Category.donations),
      ExpenseBucketModel.forCategory(expenses, Category.medications),
      ExpenseBucketModel.forCategory(expenses, Category.others),
      ExpenseBucketModel.forCategory(expenses, Category.outgoings),
      ExpenseBucketModel.forCategory(expenses, Category.transportation),
    ];
  }

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
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(77),
            Theme.of(context).colorScheme.primary.withAlpha(255),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        // categoryIcons[bucket.category],
                        bucket.category.icon,
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(179),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
