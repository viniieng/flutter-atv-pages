import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/professional_list_screen.dart';
import 'screens/professional_profile_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/service_history_screen.dart';
import 'screens/rating_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(HubBarbeariaApp());
}

class HubBarbeariaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hub Barbearia',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (_) => LoginScreen(),
        '/home': (_) => HomeScreen(),
        '/professionals': (_) => ProfessionalListScreen(),
        '/profile': (_) => ProfessionalProfileScreen(),
        '/schedule': (_) => ScheduleScreen(),
        '/confirmation': (_) => ConfirmationScreen(),
        '/history': (_) => ServiceHistoryScreen(),
        '/rating': (_) => RatingScreen(),
        '/chat': (_) => ChatScreen(),
        '/settings': (_) => SettingsScreen(),
      },
    );
  }
}
