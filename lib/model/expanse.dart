 import "package:uuid/uuid.dart";

 const uuid= Uuid(); // it will generate a random id for the id property for each expanse
class ExpanseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  ExpanseModel({
    required this.title,
    required this.amount,
    required this.date,
  }): id= uuid.v4(); // each time it create the object of this class it will generate a random id for the id property
}
