
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double fill ;
  const ChartBar({Key? key, required this.fill,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final bool isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(decoration: BoxDecoration(
            color: isDark ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          ),
        ),
      )
    );
  }
}
