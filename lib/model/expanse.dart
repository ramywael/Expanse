 import 'package:flutter/material.dart';
import "package:uuid/uuid.dart";
import 'package:intl/intl.dart';

 const uuid= Uuid(); // it will generate a random id for the id property for each expanse
 enum Category  {food,work,travel,entertainment,other,}
 //Now if i want to make each category displays a meaning Icon to it we can store it inside the map
 const categoryIconData={
   Category.food: Icons.favorite,
   Category.work: Icons.work,
   Category.travel: Icons.flight,
   Category.entertainment: Icons.movie,
   Category.other: Icons.money,
 };
 // enum looks like the class but with specific properties
 final dataFormat =DateFormat.yMd();
class ExpanseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;






  String get dateFormated{
    return dataFormat.format(date);
  }


  ExpanseModel({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }): id= uuid.v4(); // each time it create the object of this class it will generate a random id for the id property
}
