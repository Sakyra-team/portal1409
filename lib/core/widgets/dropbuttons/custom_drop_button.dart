import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

class CustomDropButton extends StatefulWidget {
  const CustomDropButton({
    super.key,
    required this.valueChanged,
    required this.placeholder,
    required this.list,
    this.text,
  });

  final ValueChanged<int?> valueChanged;
  final String placeholder;
  final List<List> list;
  final String? text;

  @override
  State<CustomDropButton> createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  final GlobalKey _key = GlobalKey();
  final LayerLink _link = LayerLink();

  late bool isOpenOverlay = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CompositedTransformTarget(
      link: _link,
      child: GestureDetector(
        key: _key,
        onTap: () async {
          FocusScope.of(context).unfocus();

          setState(() => isOpenOverlay = true);

          final int? result = await _showOverlay(context, widget.list);

          if (!mounted) return;
          setState(() => isOpenOverlay = false);

          widget.valueChanged(result);
        },
        child: Container(
          padding: const .only(right: 12, left: 24),
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: theme.cardColor,
            border: .all(color: theme.dividerColor),
            borderRadius: .all(.circular(21)),
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(widget.text ?? widget.placeholder, style: theme.textTheme.titleSmall),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                    child: ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                  );
                },
                child: isOpenOverlay
                    ? Icon(
                        key: const ValueKey('close'),
                        Icons.close,
                        color: theme.hintColor,
                        size: 22,
                      )
                    : Icon(
                        key: const ValueKey('arrow'),

                        Icons.arrow_forward_ios,
                        color: theme.hintColor,
                        size: 22,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int?> _showOverlay(BuildContext context, List<List> list) async {
    final int? result = await showOverlay(context, list, _key, .big, _link);
    return result;
  }
}
