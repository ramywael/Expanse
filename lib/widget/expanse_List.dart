import 'package:flutter/material.dart';

import '../model/expanse.dart';
import 'expanse_item.dart';

class ExpanseList extends StatelessWidget {
  const ExpanseList({
    super.key,
    required List<ExpanseModel> expanseList,
  }) : _expanseList = expanseList;

  final List<ExpanseModel> _expanseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _expanseList.length,
      itemBuilder: (context, index) {
        return ExplanseItem(expanseItem: _expanseList[index]);
      },
    );
  }
}

