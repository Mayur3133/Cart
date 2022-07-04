import 'package:flutter/material.dart';

class empty extends StatefulWidget {
  const empty({Key? key}) : super(key: key);

  @override
  State<empty> createState() => _emptyState();
}

class _emptyState extends State<empty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Your cart is empty")],
        ),
      ),
    );
  }
}
