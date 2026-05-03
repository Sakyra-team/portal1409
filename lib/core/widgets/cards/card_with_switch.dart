import 'package:flutter/material.dart';

class SwitchCard extends StatefulWidget {
  const SwitchCard({
    super.key,
    required this.text,
    required this.funcOn,
    required this.funcOff,
    this.leadingIcon,
    this.default_,
  });

  final String text;
  final VoidCallback funcOn;
  final VoidCallback funcOff;
  final IconData? leadingIcon;
  final bool? default_;

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  bool isActive = false;

  @override
  void initState() {
    isActive = widget.default_ ?? false;
    super.initState();
  }

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
        child: ClipRRect(
          borderRadius: .circular(15),
          child: BackdropFilter(
            filter: .blur(sigmaX: 26, sigmaY: 26),
            child: Container(
              width: double.infinity,
              height: 73,
              padding: .symmetric(horizontal: 12),
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
                      widget.leadingIcon != null
                          ? Icon(widget.leadingIcon, size: 32)
                          : const SizedBox(),

                      Text(
                        widget.text,
                        style: theme.textTheme.titleSmall,
                        softWrap: true,
                      ),
                    ],
                  ),

                  Switch(
                    value: isActive,
                    onChanged: (bool value) {
                      if (value) {
                        widget.funcOn();
                      } else {
                        widget.funcOff();
                      }
                      setState(() => isActive = value);
                    },
                    trackOutlineWidth: .all(0),
                    trackColor: isActive
                        ? .all(theme.primaryColor)
                        : .all(Colors.transparent),
                    activeThumbColor: Colors.white,
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
