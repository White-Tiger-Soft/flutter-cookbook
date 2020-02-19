import 'package:flutter/material.dart';
import 'dart:async';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

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

class MyWidget extends StatefulWidget {
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ValueNotifier<int> _counterNotifier = ValueNotifier<int>(0);

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _counterNotifier.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _counterNotifier,
        builder: (context, value, child) {
          return Text('$value',
              style: Theme.of(context).textTheme.headline4);
        });
  }
}
