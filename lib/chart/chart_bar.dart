
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double fill ; // the percentage that will be used to fill the bar
  const ChartBar({Key? key, required this.fill,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }
}
