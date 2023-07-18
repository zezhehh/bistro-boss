import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:namer_app/components/card_floating_button.dart';
import 'package:namer_app/pages/proposal_selector.dart';

import '../components/dish_card.dart';

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

class ProposalGenerator extends StatelessWidget {
  const ProposalGenerator({super.key});

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
            title: Text("Create a proposal for dinner"),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DishCard(
                  actions: CardFloatingButton(
                    children: [
                      Text('4 eggs'),
                      Text('2 apples'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
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
          Column(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProposalSelector()),
                );
              },
              style: style,
              child: Text("Add additional dish"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showAlertDialog(context);
              },
              style: style,
              child: Text("Send proposal"),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
