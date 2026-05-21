import 'package:expenses_tracker/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainContentWid extends StatelessWidget {
  const MainContentWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Text(
          textAlign: TextAlign.center,
          S.of(context).ExpensesListIsEmpty,
        ),
      ),
    );
  }
}
