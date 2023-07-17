import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

final supabase = Supabase.instance.client;

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBar(),
        Center(
          child: ElevatedButton(
            child: Text('Sign Out'),
            onPressed: () {
              print('cliced');
              supabase.auth.signOut().then((value) {
                print('signed out');
                GoRouter.of(context).go('/login');
              });
            },
          ),
        ),
      ],
    ));
  }
}
