import 'package:flutter/material.dart';

import '../model/expanse.dart';
import 'expanse_item.dart';

class ExpanseList extends StatelessWidget {
  final void Function(ExpanseModel) removeExpanse;
  const ExpanseList({
    super.key,
    required List<ExpanseModel> expanseList, required this.removeExpanse,
  }) : _expanseList = expanseList;

  final List<ExpanseModel> _expanseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _expanseList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(_expanseList[index]), // each item should have a key to identify the item
         background: Container(
           color: ThemeMode == ThemeMode.dark ? Colors.red : Theme.of(context).colorScheme.error,
           margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal)
        ),
          onDismissed:(direction) => removeExpanse(_expanseList[index]),
          child: ExplanseItem(
            expanseItem: _expanseList[index],
          ),
        );
      },
    );
  }
}
