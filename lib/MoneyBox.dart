// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class MoneyBox extends StatelessWidget {
  double amount;
  Color color;

  MoneyBox(this.amount, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: double.infinity,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Balance :",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Expanded(
              child: Text(
                "${NumberFormat("#,##0.00").format(amount)} \$",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Tahoma"),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
