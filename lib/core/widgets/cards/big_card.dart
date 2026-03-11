import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.icon, required this.text, required this.func, });

  final Icon icon;
  final String text;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: func,
      child: ClipRRect(
        borderRadius: .circular(15),
        child: BackdropFilter(
          filter: .blur(sigmaX: 26, sigmaY: 26),
          child: Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              border: Border.all(color: .fromARGB(255, 51, 51, 53)),
              borderRadius: .circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .center,
                children: [
                  icon,
                  Text(
                    text,
                    softWrap: true,
                    textAlign: .center,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: .w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
