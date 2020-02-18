import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: TestWidget("Flexible loose", Colors.blue.shade300),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: TestWidget("Flexible tight", Colors.green.shade300),
            ),
            Expanded(
              child: TestWidget("Expanded", Colors.red.shade300),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
              "Expanded это Flexible с параметром fit равным FlexFit.tight"),
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TestWidget("Flex = 1, 1/6", Colors.blue.shade300),
            ),
            Expanded(
              flex: 2,
              child: TestWidget("Flex = 2, 2/6", Colors.green.shade300),
            ),
            Expanded(
              flex: 3,
              child: TestWidget("Flex = 3, 3/6", Colors.red.shade300),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
              "Параметр flex указывает какую часть доступного пространства занимает Flexible. Он не займет пространство больше выделенного, даже если есть свободное. Данный эффект можно использовать, для того что бы определить границы виджета не больше родительских. Пример:"),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Данный текст неограничен справа, поэтому выходит за пределы виджета. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce efficitur nisi eget consequat finibus.", style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.red),),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                    "Данный текст ограничен свойством flex внутри виджета Expanded, поэтому переносится на новую строку. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.green),),
              ),
            ),
          ],
        ),        
        Divider(),
        Row(
          children: [
            Flexible(child: TestWidget("Flexible loose", Colors.blue.shade300)),
            Spacer(),
            Expanded(
              child: TestWidget("Expanded", Colors.red.shade300),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
              "Spacer создает Expanded с указанным flex и пустым виджетом внутри (SizedBox.shrink())"),
        ),
      ],
    );
  }
}
