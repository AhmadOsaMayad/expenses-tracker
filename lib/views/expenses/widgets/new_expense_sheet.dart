import 'dart:developer';

import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/views/expenses/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
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
            title: 'Title',
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  textController: _amountController,
                  maxLength: 9,
                  title: 'Amount',
                  currencyInit: '${Currency.usd.init} ',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    const Icon(Icons.calendar_today),
                    TextButton(
                      onPressed: _onSelectDate,
                      child: Text(
                        _selectedDateTime == null
                            ? 'Select Date'
                            : DateFormat.yMd().add_jm().format(
                                _selectedDateTime!,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Row(
              //     children: [
              //       DropdownButton(
              //         items: const [
              //           DropdownMenuItem(value: 'Food', child: Text('Food')),
              //           DropdownMenuItem(
              //             value: 'Transport',
              //             child: Text('Transport'),
              //           ),
              //           DropdownMenuItem(
              //             value: 'Entertainment',
              //             child: Text('Entertainment'),
              //           ),
              //         ],
              //         onChanged: (value) {
              //           log(value!);
              //         },
              //         hint: const Text('Category'),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  log(_titleController.text);
                  log(_amountController.text);
                },
                child: const Text('Save Expense'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
