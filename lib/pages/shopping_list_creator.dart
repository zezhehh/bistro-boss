import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/pages/settings.dart';

import '../components/card_floating_button.dart';
import '../components/ingredient_card.dart';
import '../components/notification_card.dart';
import '../components/notification_modal.dart';
import '../components/shopping_list.dart';

showAlertDialog(BuildContext context) {
  Widget cancelButton = ElevatedButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text("Export"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Confirmation"),
    content: Column(
      children: [
        Text("Would you like to export the shopping list?"),
        ShoppingList(
          height: 600,
          width: 595,
        ),
      ],
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class ShoppingListCreator extends StatefulWidget {
  const ShoppingListCreator({super.key});

  @override
  State<ShoppingListCreator> createState() => _ShoppingListCreatorState();
}

class _ShoppingListCreatorState extends State<ShoppingListCreator> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return FloatingDraggableWidget(
      floatingWidget: GestureDetector(
        onTap: () {
          showAlertDialog(context);
        },
        child: ShoppingList(
          height: 200,
          width: 100,
        ),
      ),
      floatingWidgetHeight: 300,
      floatingWidgetWidth: 100,
      dx: 0,
      dy: screenWidth,
      mainScreenWidget: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Manual',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome),
              label: 'Auto',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: Column(
          children: [
            AppBar(
              title: Text("Shopping List"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: Column(
                children: [
                  SearchBar(
                    leading: Icon(Icons.search),
                    hintText: "Search for a dish",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return IngredientCard(
                    actions: CardFloatingButton(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove),
                        ),
                        Text('21 pcs'),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
