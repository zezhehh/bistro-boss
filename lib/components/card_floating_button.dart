import 'package:flutter/material.dart';

class CardFloatingButton extends StatelessWidget {
  final List<Widget>? children;
  const CardFloatingButton({super.key, this.children});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple[50], borderRadius: BorderRadius.circular(8)),
          width: screenWidth * 0.8,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children ?? [],
          ),
        ),
      ),
    );
  }
}
