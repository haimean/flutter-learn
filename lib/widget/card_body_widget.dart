import 'dart:developer';

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modal/items.dart';

class CardBodyWidget extends StatelessWidget {
  final DataItems item;
  final Function removeTask;
  const CardBodyWidget(
      {super.key, required this.item, required this.removeTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xffDfdfdf),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff4b4b4b),
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  removeTask(item.id);
                }
                return log('pressedCancel');
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4b4b4b),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
