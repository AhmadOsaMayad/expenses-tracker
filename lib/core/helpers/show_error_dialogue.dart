import 'package:expenses_tracker/generated/l10n.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(S.of(context).ok),
        ),
      ],
    ),
  );
}
