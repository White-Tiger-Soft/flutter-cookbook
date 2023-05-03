import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: TestWidget(
                text: "Flexible loose",
                color: Colors.blue.shade300,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: TestWidget(
                text: "Flexible tight",
                color: Colors.green.shade300,
              ),
            ),
            Expanded(
              child: TestWidget(
                text: "Expanded",
                color: Colors.red.shade300,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'Expanded это Flexible с параметром fit равным FlexFit.tight. '
            'Параметр fit отвечает зато, будет виджет заполнять всё доступное пространство '
            'или размер виджета будет определятся дочерним элементом',
          ),
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TestWidget(
                text: "Flex = 1, 1/6",
                color: Colors.blue.shade300,
              ),
            ),
            Expanded(
              flex: 2,
              child: TestWidget(
                text: "Flex = 2, 2/6",
                color: Colors.green.shade300,
              ),
            ),
            Expanded(
              flex: 3,
              child: TestWidget(
                text: "Flex = 3, 3/6",
                color: Colors.red.shade300,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'Параметр flex указывает какую часть доступного пространства занимает Flexible.\n'
            'Он не займет пространство больше выделенного, даже если есть свободное. '
            'Данный эффект можно использовать, для того что бы определить границы виджета не больше родительских. Пример:',
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'Данный текст неограничен справа, поэтому выходит за пределы виджета. '
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce efficitur nisi eget consequat finibus.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: Colors.red),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Данный текст ограничен свойством flex внутри виджета Expanded, '
                  'поэтому переносится на новую строку. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Flexible(
              child: TestWidget(
                text: "Flexible loose",
                color: Colors.blue.shade300,
              ),
            ),
            Spacer(),
            Expanded(
              child: TestWidget(
                text: "Expanded",
                color: Colors.red.shade300,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'Spacer создает Expanded с указанным flex '
            'и пустым виджетом внутри (SizedBox.shrink())',
          ),
        ),
      ],
    );
  }
}

class TestWidget extends StatelessWidget {
  final String text;
  final Color color;

  TestWidget({
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(16),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
