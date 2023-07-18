import 'package:flutter/material.dart';
import 'package:namer_app/components/thumbnail.dart';
import 'package:namer_app/pages/settings.dart';
import 'package:namer_app/pages/shopping_list_creator.dart';
import 'package:provider/provider.dart';

import '../components/card_floating_button.dart';
import '../components/ingredient_card.dart';
import '../components/notification_card.dart';
import '../components/notification_modal.dart';

showAlertDialog(BuildContext context) {
  Widget cancelButton = ElevatedButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text("Send"),
    onPressed: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Confirmation"),
    content: Text("Would you like to send the proposal?"),
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

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text("Inventory"),
          ),
          SizedBox(
            width: screenWidth * 0.8,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SearchBar(
                  leading: Icon(Icons.search),
                  hintText: "Search for a dish",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Scan'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider<ThumbnailState>(
                                create: (_) => ThumbnailState(),
                                child: ShoppingListCreator(),
                              ),
                            ),
                          );
                        },
                        child: Text('Create shopping list'),
                      ),
                    ),
                  ],
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
    );
  }
}
