import 'package:flutter/material.dart';

class DeskriptionCard extends StatelessWidget {
  const DeskriptionCard({
    super.key,
    required this.text,
    required this.date,
     required this.time,
    required this.leading,
    required this.action,
    required this.func,
    required this.actionFunc
  });

  final String text;
  final String date;
  final String time;
  final IconData leading;
  final IconData action;
  final VoidCallback func;
  final VoidCallback actionFunc;

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
            width: double.infinity,
            height: 73,
            decoration: BoxDecoration(
              color: theme.cardColor,
              border: .all(color: const .fromARGB(255, 51, 51, 53)),
              borderRadius: .circular(15),
            ),

            child: Center(
              child: Padding(
                padding: const .symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(leading, size: 32),
                    const SizedBox(width: 7),

                    Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text(text, style: theme.textTheme.titleSmall),
                        Row(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              date,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.hintColor,
                              ),
                            ),
                            const SizedBox(width: 64),
                            Text(
                              time,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Spacer(),

                    Icon(action, size: 32),
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
