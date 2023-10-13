import 'package:expanse/chart/chart_bar.dart';
import 'package:flutter/material.dart';

import '../model/expanse.dart';

class Chart extends StatelessWidget {
  final List<ExpanseModel> expansesList;
  const Chart({Key? key, required this.expansesList}) : super(key: key);
  List<ExpansesBucket> get buckets {
    return [
      ExpansesBucket.forCategory(Category.food, expansesList),
      ExpansesBucket.forCategory(Category.travel, expansesList),
      ExpansesBucket.forCategory(Category.entertainment, expansesList),
      ExpansesBucket.forCategory(Category.work, expansesList),
      ExpansesBucket.forCategory(Category.other, expansesList),
    ];
  }

  double get maxAmount {
    double maxAmountForCategory = 0;
    for (var bucket in buckets) {
      if (bucket.totalAmount > maxAmountForCategory) {
        maxAmountForCategory = bucket.totalAmount;
      }
    }
    return maxAmountForCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        width: double.infinity,
        height: 180,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final element in buckets)
                    ChartBar(
                      fill: element.totalAmount == 0
                          ? 0
                          : element.totalAmount / maxAmount,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
                children: buckets
                    .map(
                      (e) => const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.abc,
                          ),
                        ),
                      ),
                    )
                    .toList())
          ],
        ));
  }
}
