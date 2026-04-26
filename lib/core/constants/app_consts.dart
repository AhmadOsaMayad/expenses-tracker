import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);
const kLocalizationDelgs = <LocalizationsDelegate<dynamic>>[
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

final List<ExpenseModel> kDummyExpenses = [
  ExpenseModel(
    id: uuid.v4(),
    title: 'Pizza Dinner',
    amount: 15.99,
    date: DateTime(2026, 4, 10, 20, 30),
    category: Category.food,
    currency: Currency.usd,
  ),
  ExpenseModel(
    id: uuid.v4(),
    title: 'Flight to Cairo',
    amount: 250.00,
    date: DateTime(2026, 3, 28, 15, 45),
    category: Category.travel,
    currency: Currency.usd,
  ),
  ExpenseModel(
    id: uuid.v4(),
    title: 'Movie Night',
    amount: 12.50,
    date: DateTime(2026, 4, 5, 20, 30),
    category: Category.leisure,
    currency: Currency.usd,
  ),
  ExpenseModel(
    id: uuid.v4(),
    title: 'Laptop Purchase',
    amount: 1200.00,
    date: DateTime.now(),
    category: Category.work,
    currency: Currency.usd,
  ),
];


// const [
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ]