import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  const NotificationCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: SizedBox(
        width: screenWidth * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(message),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                IconButton(onPressed: () {}, icon: Icon(Icons.close))
              ],
            )
          ],
        ),
      ),
    );
  }
}
