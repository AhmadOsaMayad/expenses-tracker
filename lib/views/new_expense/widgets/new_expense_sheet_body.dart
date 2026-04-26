import 'dart:developer';
import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/core/helpers/date_helpers.dart';
import 'package:expenses_tracker/core/helpers/is_arabic.dart';
import 'package:expenses_tracker/core/helpers/show_error_dialogue.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/views/new_expense/widgets/new_expense_sheet_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewExpenseSheetBody extends StatefulWidget {
  const NewExpenseSheetBody({super.key});

  @override
  State<NewExpenseSheetBody> createState() => _NewExpenseSheetBodyState();
}

class _NewExpenseSheetBodyState extends State<NewExpenseSheetBody> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDateTime;
  Category _selectedCategory = Category.values.first;
  Currency _selectedCurrency = Currency.usd;
  late ExpenseModel? _newExpense;

  Widget _buildDropdownField<T>({
    required T selectedValue,
    required String label,
    required Widget prefix,
    required List<T> values,
    required String Function(T value) itemLabel,
    required void Function(T value) onChanged,
    TextStyle? itemTextStyle,
  }) {
    return DropdownButtonFormField<T>(
      menuMaxHeight: 200,
      initialValue: selectedValue,
      decoration: InputDecoration(label: Text(label), prefix: prefix),
      items: values
          .map(
            (value) => DropdownMenuItem<T>(
              value: value,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(itemLabel(value), style: itemTextStyle),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        onChanged(value);
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _onSelectDate() async {
    final selectedDate = await DateHelpers.showDefDatePicker(context);
    if (mounted) {
      if (selectedDate == null) return;
      final selectedTime = await DateHelpers.showDefTimePicker(context);
      if (selectedTime == null) return;
      final selectedDateTime = DateHelpers.dateTimeReturner(
        selectedDate,
        selectedTime,
      );
      setState(() {
        _selectedDateTime = selectedDateTime;
      });
      log('Selected date & time: $selectedDateTime');
    }
  }

  bool _isUnValidData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsUnValid = enteredAmount == null || enteredAmount <= 0
        ? true
        : false;
    final titleIsUnValid = _titleController.text.trim().isEmpty;
    final isItUnValid = amountIsUnValid || titleIsUnValid;

    if (_selectedDateTime == null) {
      setState(() {
        _selectedDateTime = DateTime.now();
      });
    }

    return isItUnValid;
  }

  bool _submitExpenseData() {
    if (_isUnValidData()) {
      showErrorDialog(
        context,
        S.of(context).sorry,
        S.of(context).invalidDataMsg,
      );
      return false;
    }
    _assignNewExpense();
    return true;
  }

  void _assignNewExpense() {
    _newExpense = ExpenseModel(
      id: uuid.v4(),
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      date: _selectedDateTime!,
      category: _selectedCategory,
      currency: _selectedCurrency,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sText = S.of(context);
    return NewExpenseSheetLayoutBuilder(
      titleController: _titleController,
      amountController: _amountController,
      selectedCurrency: _selectedCurrency,
      selectedDateTime: _selectedDateTime,
      onSelectDate: _onSelectDate,
      categoryDropdown: _buildDropdownField<Category>(
        selectedValue: _selectedCategory,
        label: sText.category,
        prefix: Icon(_selectedCategory.icon, size: 16),
        values: Category.values,
        itemLabel: (category) => isArabic() ? category.arName : category.enName,
        onChanged: (value) {
          setState(() {
            _selectedCategory = value;
          });
        },
      ),
      currencyDropdown: _buildDropdownField<Currency>(
        selectedValue: _selectedCurrency,
        label: sText.currency,
        prefix: Icon(FontAwesomeIcons.handHoldingDollar.data, size: 16),
        values: Currency.values,
        itemLabel: (currency) => isArabic() ? currency.arName : currency.enName,
        itemTextStyle: const TextStyle(fontSize: 14),
        onChanged: (value) {
          setState(() {
            _selectedCurrency = value;
          });
        },
      ),
      onCancel: () {
        Navigator.pop(context);
      },
      onSave: () {
        if (!_submitExpenseData()) return;
        Navigator.of(context).pop(_newExpense);
      },
    );
  }
}
