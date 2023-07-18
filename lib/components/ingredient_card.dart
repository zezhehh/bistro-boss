import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final Widget? actions;
  final double heightRatio;
  const IngredientCard({
    super.key,
    this.actions,
    this.heightRatio = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenWidth);
    return Align(
      alignment: Alignment.center,
      child: Card(
        child: Container(
          height: heightRatio * screenHeight,
          width: 0.8 * screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://cdn.cheapism.com/images/Brown-Bag-of-Fresh-Potatoes.2e16d0ba.fill-1440x605.jpg",
              ),
            ),
          ),
          child: actions,
        ),
      ),
    );
  }
}
