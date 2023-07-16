import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:namer_app/route_state.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SupaSocialsAuth(
              socialProviders: [
                SocialProviders.google,
                SocialProviders.facebook,
              ],
              colored: true,
              redirectUrl: 'io.supabase.flutter://reset-callback/',
              onSuccess: (Session response) {
                print(response);
                GoRouter.of(context).go('/onboarding');
              },
              onError: (error) {
                print(error);
              },
            ),
          ],
        ),
      ),
    );
  }
}
