import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expanse/model/expanse.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({Key? key}) : super(key: key);

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final now = DateTime.now();
  DateTime? _selectedDate;
   Category _selectedCategory= Category.food;
  final formatter = DateFormat.yMd();
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
            keyboardType: TextInputType
                .text, //the max number of characters that the user can enter
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: "\$",
                  ),
                  keyboardType: TextInputType
                      .number, //the max number of characters that the user can enter
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? "No Date Selected"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        final DateTime? pickedData = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = pickedData;
                        });
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  //it is the value that will be displayed in the dropdown button
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (newCat) {
                    setState(() {
                      if(newCat == null) return;
                      _selectedCategory=newCat;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    log(_titleController.text);
                    final double? _doubledamount = double.tryParse(_amountController.text);
                    final bool _isAmountInvalid= _doubledamount == null || _doubledamount <= 0;
                    if(_titleController.text.trim().isEmpty || _isAmountInvalid || _selectedDate == null) {
                      log("Error");
                      //the trim function used to remove the white spaces from the string
                    }
                    _titleController.clear();
                    _amountController.clear();
                  },
                  child: const Text("Save Expanse"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
