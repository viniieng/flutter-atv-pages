import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'core/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final theme = ThemeController();
  await theme.load();
  runApp(
    ChangeNotifierProvider.value(
      value: theme,
      child: const MyApp(),
    ),
  );
}
