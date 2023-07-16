import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:namer_app/pages/notifications.dart';
import 'package:namer_app/pages/proposal_generator.dart';
import 'package:namer_app/pages/settings.dart';
import '../components/dish_carousel.dart';
import '../components/home_selection.dart';
import '../components/notification_card.dart';

import '../components/notification_modal.dart';
import '../route_state.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: HomeSelection(),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProposalGenerator(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          activeIndex: currentPageIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          icons: const <IconData>[
            Icons.explore_outlined,
            Icons.inventory_2_outlined,
          ],
          iconSize: 30,
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: Center(
            child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                  }
                },
              ),
              title: Text('Zezhe\'s Hsome'),
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
                    context: context,
                    builder: (context) => NotificationModal());
              },
              child: NotificationCard(),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: (Column(
                children: [
                  Text("What you had this week:"),
                  DishCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("What people had in your community:"),
                  DishCarousel(),
                ],
              ))),
            ),
          ],
        )));
  }
}
