import 'package:flutter/material.dart';

class HomeSelection extends StatefulWidget {
  const HomeSelection({super.key});

  @override
  State<HomeSelection> createState() => _HomeSelectionState();
}

class _HomeSelectionState extends State<HomeSelection> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            margin: EdgeInsets.all(0),
            child: Center(child: Text('Home List')),
          ),
          Expanded(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: const Text('Home 1'),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(0);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Home 2'),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(1);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Home 3'),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(2);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
