import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/views/expenses/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpenseLandscLayout extends StatelessWidget {
  const NewExpenseLandscLayout({
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
    final sText = S.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: CustomTextField(
                textController: titleController,
                maxLength: 50,
                title: sText.newExpenseTitle,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              flex: 2,
              child: CustomTextField(
                textController: amountController,
                maxLength: 9,
                title: sText.amount,
                currencyInit: '${selectedCurrency.init} ',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: currencyDropdown),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: onSelectDate,
                    child: Text(
                      selectedDateTime == null
                          ? sText.selectDate
                          : DateFormat.yMd().add_jm().format(selectedDateTime!),
                    ),
                  ),
                  const Icon(Icons.calendar_today, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: categoryDropdown),
            const SizedBox(width: 25),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: onCancel, child: Text(sText.cancel)),
                  ElevatedButton(
                    onPressed: onSave,
                    child: Text(sText.saveExpense),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
