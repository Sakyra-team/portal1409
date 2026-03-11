import 'package:flutter/material.dart';

class ElevatorWidget extends StatelessWidget {
  const ElevatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text("Вызов лифта", style: theme.textTheme.titleSmall),
        const SizedBox(height: 16),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 24 - 25) / 2,
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 2.52,
            children: [
              ClipRRect(
                borderRadius: .circular(10),
                child: BackdropFilter(
                  filter: .blur(sigmaX: 26, sigmaY: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      border: Border.all(color: .fromARGB(255, 51, 51, 53)),
                      borderRadius: .circular(10),
                    ),
                    child: Center(
                      child: Text("1 этаж", style: theme.textTheme.labelSmall),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: .circular(10),
                child: BackdropFilter(
                  filter: .blur(sigmaX: 26, sigmaY: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      border: Border.all(color: .fromARGB(255, 51, 51, 53)),
                      borderRadius: .circular(10),
                    ),
                    child: Center(
                      child: Text("2 этаж", style: theme.textTheme.labelSmall),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: .circular(10),
                child: BackdropFilter(
                  filter: .blur(sigmaX: 26, sigmaY: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      border: Border.all(color: .fromARGB(255, 51, 51, 53)),
                      borderRadius: .circular(10),
                    ),
                    child: Center(
                      child: Text("3 этаж", style: theme.textTheme.labelSmall),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: .circular(10),
                child: BackdropFilter(
                  filter: .blur(sigmaX: 26, sigmaY: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      border: Border.all(color: .fromARGB(255, 51, 51, 53)),
                      borderRadius: .circular(10),
                    ),
                    child: Center(
                      child: Text("4 этаж", style: theme.textTheme.labelSmall),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
