import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DishCarousel extends StatelessWidget {
  final Widget? actions;
  const DishCarousel({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(height: screenHeight * 0.3),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            // return Container(
            //     width: MediaQuery.of(context).size.width,
            //     margin: EdgeInsets.symmetric(horizontal: 5.0),
            //     decoration: BoxDecoration(color: Colors.amber),
            //     child: Text(
            //       'text $i',
            //       style: TextStyle(fontSize: 16.0),
            //     ));
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.squarespace-cdn.com/content/v1/54b1510ce4b059ddb550bcff/1556330181601-ZRRM870OJJOFN0PJO2XJ/brooklyn-wedding-photographer-rob-allen-photography-TheGreenBuilding-LU-28.jpg?format=1500w"),
                  ),
                ),
                child: actions,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
