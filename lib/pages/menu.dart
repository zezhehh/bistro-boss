import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

final supabase = Supabase.instance.client;

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var style = ElevatedButton.styleFrom(
      minimumSize: Size(screenWidth * 0.8, 50),
    );
    return Scaffold(
        body: Column(
      children: [
        AppBar(),
        Center(
          child: Column(
            children: [
              ElevatedButton(
                style: style,
                child: Text('Manage all dishes'),
                onPressed: () {
                  print('cliced');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: style,
                child: Text('Manage all recipes'),
                onPressed: () {
                  print('cliced');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: style,
                child: Text('Manage all ingredients'),
                onPressed: () {
                  print('cliced');
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
