import 'package:expenses_tracker/views/new_expense/widgets/new_expense_sheet_body.dart';
import 'package:flutter/material.dart';

class NewExpenseSheet extends StatelessWidget {
  const NewExpenseSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsetsGeometry.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const Padding(
            padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: NewExpenseSheetBody(),
          ),
        ),
      ),
    );
  }
}
