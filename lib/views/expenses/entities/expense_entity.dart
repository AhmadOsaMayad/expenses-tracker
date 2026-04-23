import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:intl/intl.dart';

class ExpenseEntity {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final Currency currency;
  final formatter = DateFormat.yMd().add_jm();

  ExpenseEntity({
    required this.currency,
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  String get formattedAmount => amount.toStringAsFixed(2);
  String get formattedDate => formatter.format(date);

  @override
  String toString() {
    return 'ExpenseEntity(id: $id, title: $title, amount: $amount, date: $date, category: ${category.enName}, currency: ${currency.init})';
  }
}
