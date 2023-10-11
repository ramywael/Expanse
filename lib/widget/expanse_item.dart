import 'package:flutter/material.dart';

import '../model/expanse.dart';

class ExplanseItem extends StatelessWidget {
  final ExpanseModel expanseItem;
  const ExplanseItem({
    super.key,
    required this.expanseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              expanseItem.title,
            ),
            Row(
              children: [
                Text(
                  "\$${expanseItem.amount.toStringAsFixed(2)}", // \ is used to add the dollar sign
                  // toStringAsFixed(2) is used to show the amount with 2 decimal points
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(expanseItem.dateFormated),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
