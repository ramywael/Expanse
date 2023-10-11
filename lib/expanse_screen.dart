import 'package:expanse/widget/expanse_List.dart';
import 'package:expanse/widget/new_expanse.dart';
import 'package:flutter/material.dart';

import 'model/expanse.dart';

class Expanses extends StatefulWidget {
  const Expanses({Key? key}) : super(key: key);

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<ExpanseModel> _expanseList = [
    ExpanseModel(
      category: Category.food,
      title: "Burger",
      amount: 29.7,
      date: DateTime.now(),
    ),
    ExpanseModel(
        category: Category.travel,
        title: "Paris",
        amount: 2000,
        date: DateTime.now()),
    ExpanseModel(
        category: Category.work,
        title: "Metro",
        amount: 10,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return const  NewExpanse();
                },
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpanseList(expanseList: _expanseList),
          )
        ],
      ),
    );
  }
}
