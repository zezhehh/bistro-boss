import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final Widget? actions;
  final double heightRatio;
  const DishCard({
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
                  "https://images.squarespace-cdn.com/content/v1/54b1510ce4b059ddb550bcff/1556330181601-ZRRM870OJJOFN0PJO2XJ/brooklyn-wedding-photographer-rob-allen-photography-TheGreenBuilding-LU-28.jpg?format=1500w"),
            ),
          ),
          child: actions,
        ),
      ),
    );
  }
}
