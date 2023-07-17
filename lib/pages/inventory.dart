import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          AppBar(),
          ElevatedButton(
            child: Text('under construction'),
            onPressed: () {
              print('cliced');
            },
          ),
        ],
      ),
    ));
  }
}
