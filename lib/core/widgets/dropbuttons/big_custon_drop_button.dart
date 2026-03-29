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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      key: _key,
      onTap: () async => await _showOverlay(context, widget.list),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: const .fromARGB(0, 0, 0, 0),
          border: .all(color: const .fromARGB(255, 204, 204, 204)),
          borderRadius: .all(.circular(21)),
        ),
        child: Row(
          mainAxisAlignment: .spaceAround,
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
    );
  }

  Future<int> _showOverlay(BuildContext context, List<List> list) async {
    final int result = await showOverlay(context, list, _key, .big);
    return result;
  }
}
