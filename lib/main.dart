import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:namer_app/route_state.dart';
import 'pages/notifications.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/homepage.dart';
import 'pages/login.dart';
import 'pages/onboarding.dart';
import 'pages/settings.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  var url = dotenv.env['SUPABASE_URL']!;
  var anonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  WidgetsFlutterBinding.ensureInitialized();
  print('url and keys');
  print(url);
  print(anonKey);
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
  );
  runApp(MyApp());
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Homepage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final RouteBloc routeBloc = RouteBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteBloc>(
      create: (context) => routeBloc,
      child: MaterialApp.router(
        title: 'Bistro Boss',
        routerConfig: _router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

final supabase = Supabase.instance.client;
