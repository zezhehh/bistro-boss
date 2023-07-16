import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBar(),
        Center(
          child: ElevatedButton(
            child: Text('under construction'),
            onPressed: () {
              print('cliced');
            },
          ),
        ),
      ],
    ));
  }
}
