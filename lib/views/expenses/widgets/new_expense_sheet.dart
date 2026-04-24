import 'dart:developer';
import 'package:expenses_tracker/core/enums/category.dart';
import 'package:expenses_tracker/core/enums/currency.dart';
import 'package:expenses_tracker/core/helpers/is_arabic.dart';
import 'package:expenses_tracker/generated/l10n.dart';
import 'package:expenses_tracker/models/expense_model.dart';
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
      // icon: prefix,
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

  bool _isUnValidDatat() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsUnValid = enteredAmount == null || enteredAmount <= 0
        ? true
        : false;
    final titleIsUnValid = _titleController.text.trim().isEmpty;
    final dateIsUnValid = _selectedDateTime == null ? true : false;
    final isItUnValid = amountIsUnValid || titleIsUnValid || dateIsUnValid;

    return isItUnValid;
  }

  bool _submitExpenseData() {
    if (_isUnValidDatat()) {
      _showErrorDialog();
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

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).sorry),
        content: Text(S.of(context).invalidDataMsg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 150),
      padding: EdgeInsetsGeometry.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        const Icon(Icons.calendar_today, size: 16),
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
                    child: _buildDropdownField<Category>(
                      selectedValue: _selectedCategory,
                      label: S.of(context).category,
                      prefix: Icon(_selectedCategory.icon, size: 16),
                      values: Category.values,
                      itemLabel: (category) =>
                          isArabic() ? category.arName : category.enName,
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    flex: 4,
                    child: _buildDropdownField<Currency>(
                      selectedValue: _selectedCurrency,
                      label: S.of(context).currency,
                      prefix: Icon(
                        FontAwesomeIcons.handHoldingDollar.data,
                        size: 16,
                      ),
                      values: Currency.values,
                      itemLabel: (currency) =>
                          isArabic() ? currency.arName : currency.enName,
                      itemTextStyle: const TextStyle(fontSize: 14),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrency = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
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
                      if (!_submitExpenseData()) return;
                      Navigator.of(context).pop(_newExpense);
                    },
                    child: Text(S.of(context).saveExpense),
                  ),
                ],
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
