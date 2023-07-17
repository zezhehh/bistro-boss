import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:namer_app/route_state.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

final supabase = Supabase.instance.client;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (supabase.auth.currentUser != null) {
      print('user is not null');
      GoRouter.of(context).go('/onboarding');
    }
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
              showSuccessSnackBar: false,
              colored: true,
              onSuccess: (Session response) {
                print('success');
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
