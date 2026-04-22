import 'package:expenses_tracker/core/constants/collections_keys.dart';
import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/core/helpers/date_helpers.dart';
import 'package:expenses_tracker/views/expenses/entities/expense_entity.dart';
// import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final Currency currency;
  // final formatter = DateFormat.yMd();

  ExpenseModel({
    this.currency = Currency.usd,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  factory ExpenseModel.fromEntity(ExpenseEntity entity) => ExpenseModel(
    title: entity.title,
    amount: entity.amount,
    date: entity.date,
    category: entity.category,
    currency: entity.currency,
  );

  ExpenseEntity toEntityFromJson(Map<String, dynamic> json) => ExpenseEntity(
    id: json[CollectionsKeys.expenseID] as String,
    title: json[CollectionsKeys.expenseTitle] as String,
    amount: json[CollectionsKeys.expenseAmount] as double,
    date: DateHelpers.toDateTime(json[CollectionsKeys.expenseDate]),
    category: _getCategory(json[CollectionsKeys.expenseCategory]),
    currency: _getCurrency(json[CollectionsKeys.expenseCurrency] as String),
  );

  Map<String, dynamic> toJson() => {
    CollectionsKeys.expenseID: id,
    CollectionsKeys.expenseTitle: title,
    CollectionsKeys.expenseAmount: amount,
    CollectionsKeys.expenseDate: DateHelpers.toDateTimeString(date),
    CollectionsKeys.expenseCategory: category.enName,
    CollectionsKeys.expenseCurrency: currency.init,
  };

  ExpenseEntity toEntity() => ExpenseEntity(
    id: id,
    title: title,
    amount: amount,
    date: date,
    category: category,
    currency: currency,
  );
  Category _getCategory(String category) {
    switch (category) {
      case 'food':
        return Category.food;
      case 'travel':
        return Category.travel;
      case 'leisure':
        return Category.leisure;
      case 'work':
        return Category.work;
      default:
        return Category.food;
    }
  }

  Currency _getCurrency(String init) {
    switch (init) {
      case 'USD':
        return Currency.usd;
      case 'YER':
        return Currency.yer;
      case 'SAR':
        return Currency.sar;
      default:
        return Currency.usd;
    }
  }

  // String get formattedDate => formatter.format(date);
}
