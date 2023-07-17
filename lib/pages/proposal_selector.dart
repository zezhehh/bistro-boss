import 'package:flutter/material.dart';
import 'package:namer_app/components/card_floating_button.dart';

import '../components/dish_card.dart';

class ProposalSelector extends StatelessWidget {
  const ProposalSelector({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var style = ElevatedButton.styleFrom(
      minimumSize: Size(screenWidth * 0.8, 50),
    );
    return Scaffold(
        body: Column(
      children: [
        AppBar(
          title: Text("Add a dish for dinner"),
        ),
        SizedBox(
            width: screenWidth * 0.8,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Search for a dish"),
                ),
                SizedBox(
                  height: 20,
                ),
                ToggleButtons(
                  isSelected: [true],
                  onPressed: (int index) {},
                  children: [
                    Container(
                      width: screenWidth * 0.79,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.star),
                            Text("Magic suggestions"),
                            Tooltip(
                              message: 'frequency, inventory, rating',
                              child: Icon(Icons.question_mark),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  DishCard(
                    actions: CardFloatingButton(children: [
                      Text('4 eggs'),
                      Text('2 apples'),
                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
