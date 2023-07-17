import 'package:flutter/material.dart';
import 'package:namer_app/pages/menu.dart';
import 'package:namer_app/pages/settings.dart';

import '../components/dish_carousel.dart';
import '../components/notification_card.dart';
import '../components/notification_modal.dart';
import 'notifications.dart';

class Home extends StatelessWidget {
  final Function()? onPressed;
  const Home({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: onPressed,
            ),
            title: Text('Zezhe\'s Hsome'),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
              ),
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
            child: NotificationCard(message: "Requestasdasdsadsadsadsadasds for xxx"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("What you had this week:"),
                  DishCarousel(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
