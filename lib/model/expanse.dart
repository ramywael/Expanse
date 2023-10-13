import 'package:flutter/material.dart';
import "package:uuid/uuid.dart";
import 'package:intl/intl.dart';

const uuid =
    Uuid(); // it will generate a random id for the id property for each expanse

enum Category {
  food,
  work,
  travel,
  entertainment,
  other,
}

//Now if i want to make each category displays a meaning Icon to it we can store it inside the map
const categoryIconData = {
  Category.food: Icons.favorite,
  Category.work: Icons.work,
  Category.travel: Icons.flight,
  Category.entertainment: Icons.movie,
  Category.other: Icons.money,
};
// enum looks like the class but with specific properties
final dataFormat = DateFormat.yMd();

class ExpanseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get dateFormated {
    return dataFormat.format(date);
  }

  ExpanseModel({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid
            .v4(); // each time it create the object of this class it will generate a random id for the id property
}

// if i wanna to take each category and display its amount of money spent
// i can make a class that stored those information

class ExpansesBucket {
  final Category category;
  final List<ExpanseModel> expanses;

  ExpansesBucket(this.category, this.expanses);

  // if i wanna to get the total amount of money spent in each category
  // i can make a function that use for loop on this list
  double get totalAmount {
    double sum = 0;
    for (var element in expanses) {
      sum += element.amount;
    }
    return sum;
    // but if we look into this function it calcualte the total amount for all categories
    // and i wanna to calculate the total amount for each category
    // so i will use utility construction function (named constructor)
    // and i will pass the category and the expanses list to it
  }

  ExpansesBucket.forCategory(this.category, List<ExpanseModel> allExpanses)
      : expanses = allExpanses
            .where((element) => element.category == category)
            .toList();
}
