
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({Key? key,}) : super(key: key);

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
