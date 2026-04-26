import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/views/new_expense/widgets/new_expense_landsc_layout.dart';
import 'package:expenses_tracker/views/new_expense/widgets/new_expense_portrait_layout.dart';
import 'package:flutter/material.dart';

class NewExpenseSheetLayoutBuilder extends StatelessWidget {
  const NewExpenseSheetLayoutBuilder({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.selectedCurrency,
    required this.selectedDateTime,
    required this.onSelectDate,
    required this.categoryDropdown,
    required this.currencyDropdown,
    required this.onCancel,
    required this.onSave,
  });

  final TextEditingController titleController;
  final TextEditingController amountController;
  final Currency selectedCurrency;
  final DateTime? selectedDateTime;
  final VoidCallback onSelectDate;
  final Widget categoryDropdown;
  final Widget currencyDropdown;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return constrains.maxWidth <= 500
            ? NewExpensePortraitLayout(
                titleController: titleController,
                amountController: amountController,
                selectedCurrency: selectedCurrency,
                selectedDateTime: selectedDateTime,
                onSelectDate: onSelectDate,
                categoryDropdown: categoryDropdown,
                currencyDropdown: currencyDropdown,
                onCancel: onCancel,
                onSave: onSave,
              )
            : NewExpenseLandscLayout(
                titleController: titleController,
                amountController: amountController,
                selectedCurrency: selectedCurrency,
                selectedDateTime: selectedDateTime,
                onSelectDate: onSelectDate,
                categoryDropdown: categoryDropdown,
                currencyDropdown: currencyDropdown,
                onCancel: onCancel,
                onSave: onSave,
              );
      },
    );
  }
}
