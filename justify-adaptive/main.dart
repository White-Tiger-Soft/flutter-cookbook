import 'package:flutter/material.dart';

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

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          child: JustifyWidget(),
        ),
        Divider(),
        Container(
          width: 150,
          child: JustifyWidget(),
        ),
      ],
    );
  }
}

class JustifyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.red,
          width: 20,
          height: 50,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Container(
              color: Colors.green,
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 200,
              ),
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
