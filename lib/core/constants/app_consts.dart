import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:flutter/material.dart';

const kCategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

const kCurrencyInits = {
  Currency.usd: 'USD',
  Currency.yer: 'YER',
  Currency.sar: 'SAR',
};
