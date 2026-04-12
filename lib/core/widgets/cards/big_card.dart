import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.icon,
    required this.text,
    required this.func,
  });

  final Widget icon;
  final String text;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: InkWell(
                borderRadius: .circular(15),

        splashColor: theme.primaryColor,
        highlightColor: theme.primaryColor.withAlpha(67),
        splashFactory: InkRipple.splashFactory,
        onTap: func,
        child: ClipRRect(
          borderRadius: .circular(15),
          child: BackdropFilter(
            filter: .blur(sigmaX: 26, sigmaY: 26),
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                border: .all(color: theme.dividerColor),
                borderRadius: .circular(15),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .center,
                  children: [
                    icon,
                    const SizedBox(height: 3),
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
      ),
    );
  }
}
