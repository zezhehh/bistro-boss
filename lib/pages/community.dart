import 'package:flutter/material.dart';
import 'package:namer_app/pages/settings.dart';

import '../components/card_floating_button.dart';
import '../components/dish_card.dart';
import '../components/dish_carousel.dart';
import '../components/notification_card.dart';
import '../components/notification_modal.dart';
import 'notifications.dart';

class Community extends StatelessWidget {
  final Function()? onPressed;
  const Community({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.groups),
              onPressed: onPressed,
            ),
            title: Text('Beautiful grils'),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => NotificationModal());
            },
            child: NotificationCard(
              message: "xxx commented",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    DishCard(
                      heightRatio: 0.3,
                      actions: CardFloatingButton(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Delicious noodles by xxx'),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.comment_outlined)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
