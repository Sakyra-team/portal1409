import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.func,
    required this.actionIcon,
    this.actionIconFunc,
    this.actionIconColor,
    this.actionIconSize,
  });

  final IconData leadingIcon;
  final String text;
  final VoidCallback func;
  final IconData actionIcon;
  final VoidCallback? actionIconFunc;

  final Color? actionIconColor;
  final double? actionIconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
        borderRadius: .circular(15),
      
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
              width: double.infinity,
              height: 73,
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: .circular(15),
                border: .all(color: theme.dividerColor),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    mainAxisSize: .min,
                    children: [
                      Padding(
                        padding: const .only(left: 22, right: 16),
                        child: Icon(leadingIcon, size: 32),
                      ),

                      Text(
                        text,
                        style: theme.textTheme.titleSmall,
                        softWrap: true,
                      ),
                    ],
                  ),

                  Padding(
                    padding: const .only(right: 12),
                    child: IconButton(
                      onPressed: actionIconFunc,
                      icon: Icon(
                        actionIcon,
                        color: actionIconColor ?? theme.primaryColor,
                        size: actionIconSize ?? 32,
                      ),
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
