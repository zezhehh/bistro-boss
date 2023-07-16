import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("Requestasdasdsadsadsadsadasds for xxx"),
        Row(children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check)),
          IconButton(onPressed: () {}, icon: Icon(Icons.close))
        ])
      ]),
    ));
  }
}
