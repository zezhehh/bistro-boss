import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:namer_app/pages/community.dart';
import 'package:namer_app/pages/home.dart';
import 'package:namer_app/pages/inventory.dart';
import 'package:namer_app/pages/settings.dart';
import '../components/community_selection.dart';
import './proposal_generator.dart';
import '../components/dish_carousel.dart';
import '../components/home_selection.dart';
import '../components/notification_card.dart';

import '../components/notification_modal.dart';
import '../route_state.dart';
import 'notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var isDialOpen = ValueNotifier<bool>(false);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> children;
    if (currentPageIndex == 0) {
      children = [
        SpeedDialChild(
          child: Icon(Icons.post_add),
          labelWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Create a proposal'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProposalGenerator(),
              ),
            );
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.rate_review),
          labelWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Record a dish'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProposalGenerator(),
              ),
            );
          },
        ),
      ];
    } else {
      children = [
        SpeedDialChild(
          child: Icon(Icons.add_a_photo),
          labelWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Share a dish'),
          ),
          onTap: () {},
        ),
        SpeedDialChild(
          child: Icon(Icons.list_alt),
          labelWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Create a menu'),
          ),
          onTap: () {},
        ),
      ];
    }
    return Scaffold(
      key: scaffoldKey,
      drawer: currentPageIndex == 0 ? HomeSelection() : CommunitySelection(),
      floatingActionButton: SpeedDial(
        shape: CircleBorder(),
        children: children,
        icon: Icons.add,
        activeIcon: Icons.close,
        openCloseDial: isDialOpen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: currentPageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        icons: <IconData>[
          currentPageIndex == 0 ? Icons.home : Icons.home_outlined,
          currentPageIndex == 1 ? Icons.explore : Icons.explore_outlined,
        ],
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: currentPageIndex == 0
          ? Home(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            )
          : Community(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
    );
  }
}
