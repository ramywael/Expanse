import 'dart:developer';

import 'package:flutter/material.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({Key? key}) : super(key: key);

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

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
          TextField(
            controller: _amountController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Amount"),
            ),
            keyboardType: TextInputType
                .number, //the max number of characters that the user can enter
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  log(_titleController.text);
                },
                child: const Text("Save Expanse"),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
