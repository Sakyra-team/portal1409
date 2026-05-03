import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: .circular(15),
        ),

        child: Center(child: Text(text, style: theme.textTheme.titleSmall)),
      ),
    );
  }
}
