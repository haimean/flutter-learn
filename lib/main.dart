import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/modal/items.dart';
import 'package:todo_app/widget/card_body_widget.dart';
import 'package:todo_app/widget/card_modal_button.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [
    DataItems(id: '123', name: 'Todo 1'),
    DataItems(id: '1232342342342', name: 'Todo 2'),
    DataItems(id: '12323423432234234324432', name: 'Todo 3'),
    DataItems(id: '1323423423423', name: 'Todo 4'),
    DataItems(id: '1322342342343', name: 'Todo 5'),
    DataItems(id: '1323423', name: 'Todo 6'),
  ];

  void _handelAddTask(String name) {
    log('_handelAddTask');
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handelRemoveTask(String id) {
    log("_handelRemoveTask");
    log(id);
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDoList",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: items
              .map((item) => CardBodyWidget(
                    item: item,
                    removeTask: _handelRemoveTask,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey[200],
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return ModalButton(addTask: _handelAddTask);
            },
          );
        },
        backgroundColor: Colors.blueAccent,
        focusColor: Colors.blue,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}

