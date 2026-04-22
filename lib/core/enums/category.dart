import 'package:flutter/material.dart';

enum Category {
  food(name: 'food', icon: Icons.lunch_dining),
  travel(name: 'travel', icon: Icons.flight),
  leisure(name: 'leisure', icon: Icons.movie),
  work(name: 'work', icon: Icons.work);

  final String name;
  final IconData icon;

  const Category({required this.name, required this.icon});
}
