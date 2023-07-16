import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
