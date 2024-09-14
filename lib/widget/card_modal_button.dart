import 'dart:developer';

import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  ModalButton({super.key, required this.addTask});
  final Function addTask;
  TextEditingController textEditingController = TextEditingController();
  void _handelOnClick(BuildContext context) {
    log('_handelOnClick');
    if (textEditingController.text != "") {
      addTask(textEditingController.text);
      Navigator.pop(context);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _handelOnClick(context),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
