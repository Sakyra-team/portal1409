import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/exit/create_exit/domain/create_exit_get_text.dart';

class SmallCustomDropButton extends StatefulWidget {
  const SmallCustomDropButton({
    super.key,
    required this.placeholder,
    required this.list,
    this.onSelect,
    this.isError,
    this.defaultText,
  });

  final String placeholder;
  final List<List> list;
  final void Function(String? value)? onSelect;
  final bool? isError;
  final String? defaultText;

  @override
  State<SmallCustomDropButton> createState() => _SmallCustomDropButtonState();
}

class _SmallCustomDropButtonState extends State<SmallCustomDropButton> {
  final GlobalKey _key = GlobalKey();
  final LayerLink _link = LayerLink();

  late bool isOpenOverlay = false;

  late String? text = widget.defaultText;

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

          final int result = await _showOverlay(context, widget.list);

          if (!mounted) return;
          setState(() {
            isOpenOverlay = false;
            if (result == -1) return;
            text = getText(result, widget.list);
          });

          widget.onSelect?.call(text);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width / 2 - 16,
          height: 80,
          padding: const .only(right: 12, left: 24),
          decoration: BoxDecoration(
            color: theme.cardColor,
            border: .all(
              color: widget.isError == true
                  ? theme.colorScheme.error
                  : theme.dividerColor,
            ),
            borderRadius: .all(.circular(21)),
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                text ?? widget.placeholder,
                style: theme.textTheme.titleSmall,
              ),
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

  Future<int> _showOverlay(BuildContext context, List<List> list) async {
    final int result = await showOverlay(context, list, _key, .small, _link);
    return result;
  }
}
