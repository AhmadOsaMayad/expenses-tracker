import 'package:flutter/material.dart';

enum Category {
  food(enName: 'Food', arName: 'طعام', icon: Icons.lunch_dining),
  travel(enName: 'Travel', arName: 'سفر', icon: Icons.flight),
  leisure(enName: 'Leisure', arName: 'ترفيه', icon: Icons.movie),
  work(enName: 'Work', arName: 'عمل', icon: Icons.work),
  bills(enName: 'Bills', arName: 'فواتير', icon: Icons.receipt_long),
  outgoings(enName: 'Outgoings', arName: 'مصاريف', icon: Icons.money_off),
  transportation(
    enName: 'Transport',
    arName: 'مواصلات',
    icon: Icons.directions_car,
  ),
  medications(
    enName: 'Medications',
    arName: 'أدوية',
    icon: Icons.medical_services,
  ),
  deposits(
    enName: 'Deposits',
    arName: 'إيداعات',
    icon: Icons.account_balance_wallet,
  ),
  donations(
    enName: 'Donations',
    arName: 'تبرعات',
    icon: Icons.volunteer_activism,
  ),
  others(enName: 'Others', arName: 'أخرى', icon: Icons.category);

  final String enName, arName;
  final IconData icon;

  const Category({
    required this.enName,
    required this.arName,
    required this.icon,
  });
}
