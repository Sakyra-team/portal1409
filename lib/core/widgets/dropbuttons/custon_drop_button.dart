import 'package:flutter/material.dart';
import 'package:portal1409/core/core.dart';

class CustomDropButton extends StatefulWidget {
  const CustomDropButton({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.list,
  });

  final TextEditingController controller;
  final String placeholder;
  final List<List> list;

  @override
  State<CustomDropButton> createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  final GlobalKey _key = GlobalKey();
  final LayerLink _link = LayerLink();


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CompositedTransformTarget(
      link: _link,
      child: GestureDetector(
        key: _key,
        onTap: () async => await _showOverlay(context, widget.list),
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
              Text(widget.placeholder, style: theme.textTheme.titleSmall),
              RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: theme.hintColor,
                    size: 22,
                  ),
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
