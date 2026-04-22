import 'dart:developer';

import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/core/helpers/is_arabic.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/views/expenses/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class NewExpenseSheet extends StatefulWidget {
  const NewExpenseSheet({super.key});

  @override
  State<NewExpenseSheet> createState() => _NewExpenseSheetState();
}

class _NewExpenseSheetState extends State<NewExpenseSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDateTime;
  Category _selectedCategory = Category.values.first;
  Currency _selectedCurrency = Currency.usd;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _onSelectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (mounted) {
      if (selectedDate == null) return;

      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime == null) return;

      final selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      setState(() {
        _selectedDateTime = selectedDateTime;
      });

      log('Selected date & time: $selectedDateTime');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          CustomTextField(
            textController: _titleController,
            maxLength: 50,
            title: S.of(context).newExpenseTitle,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomTextField(
                  textController: _amountController,
                  maxLength: 9,
                  title: S.of(context).amount,
                  currencyInit: '${_selectedCurrency.init} ',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today),
                    TextButton(
                      onPressed: _onSelectDate,
                      child: Text(
                        _selectedDateTime == null
                            ? S.of(context).selectDate
                            : DateFormat.yMd().add_jm().format(
                                _selectedDateTime!,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: DropdownButtonFormField<Category>(
                  initialValue: _selectedCategory,
                  decoration: InputDecoration(
                    label: Text(S.of(context).category),
                    prefix: Icon(_selectedCategory.icon, size: 16),
                    // border: const OutlineInputBorder(
                    //   borderSide: BorderSide(style: BorderStyle.none, width: 0),
                    // ),
                    // contentPadding: const EdgeInsets.symmetric(
                    //   horizontal: 12,
                    //   vertical: 10,
                    // ),
                  ),
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem<Category>(
                          value: category,
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              Text(
                                isArabic() ? category.arName : category.enName,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                flex: 4,
                child: DropdownButtonFormField<Currency>(
                  initialValue: _selectedCurrency,
                  decoration: InputDecoration(
                    label: Text(S.of(context).currency),
                    prefix: Icon(
                      FontAwesomeIcons.handHoldingDollar.data,
                      size: 16,
                    ),
                    // border: const OutlineInputBorder(
                    //   borderSide: BorderSide(style: BorderStyle.none, width: 0),
                    // ),
                    // contentPadding: const EdgeInsets.symmetric(
                    //   horizontal: 12,
                    //   vertical: 10,
                    // ),
                  ),
                  items: Currency.values
                      .map(
                        (currency) => DropdownMenuItem<Currency>(
                          value: currency,
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              Text(
                                isArabic() ? currency.arName : currency.enName,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCurrency = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  log(_titleController.text);
                  log(_amountController.text);
                },
                child: Text(S.of(context).saveExpense),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
