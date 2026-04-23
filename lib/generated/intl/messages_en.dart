// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "ExpensesListIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Expenses List is Empty! Try Adding some and Enjoy Your Life!",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "currency": MessageLookupByLibrary.simpleMessage("Currency"),
    "expensesTracker": MessageLookupByLibrary.simpleMessage("Expenses Tracker"),
    "hasBeenDeleted": MessageLookupByLibrary.simpleMessage("has been deleted."),
    "invalidDataMsg": MessageLookupByLibrary.simpleMessage(
      "The data you entered is invalid. Please check the values you have entered and try again.",
    ),
    "newExpenseTitle": MessageLookupByLibrary.simpleMessage(
      "New Expense\'s Title",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "saveExpense": MessageLookupByLibrary.simpleMessage("Save Expense"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select a Date"),
    "sorry": MessageLookupByLibrary.simpleMessage("Sorry!"),
    "theItem": MessageLookupByLibrary.simpleMessage("The item"),
    "undo": MessageLookupByLibrary.simpleMessage("Undo"),
  };
}
