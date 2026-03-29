import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: .circular(9),
        ),

        child: Center(child: Text(text, style: theme.textTheme.titleSmall)),
      ),
    );
  }
}
