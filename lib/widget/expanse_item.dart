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
          crossAxisAlignment:
              CrossAxisAlignment.start, // to align the text to the left
          children: [
            Text(
              expanseItem.title,
              style: Theme.of(context).textTheme.titleLarge,
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
                     Icon(categoryIconData[expanseItem.category]), //Here we access the map and then choose the key to decide which icon should be displayed
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
