import 'package:flutter/material.dart';

void main() {
  printStuff();
}

class TestWidget extends StatelessWidget {
  final String text;
  final Color color;
  TestWidget(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(16),
      child: Text(
        text ?? "",
        textAlign: TextAlign.center,
      ),
    );
  }
}
