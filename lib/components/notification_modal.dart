import 'package:flutter/material.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('XXX requested xxx'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                  onPressed: () {
                    print('pressed check');
                  },
                  icon: Icon(Icons.check)),
              IconButton(
                  onPressed: () {
                    print('pressed close');
                  },
                  icon: Icon(Icons.close)),
            ]),
          ],
        ),
      ),
    );
  }
}
