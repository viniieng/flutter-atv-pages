import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme_controller.dart';
import 'features/tasks/ui/tasks_page.dart';
import 'features/auth/ui/register_page.dart';
import 'features/products/ui/products_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeController>();
    return MaterialApp(
      title: 'Task&Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        brightness: theme.isDark ? Brightness.dark : Brightness.light,
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget { const _Home({super.key}); @override State<_Home> createState()=>_HomeState(); }
class _HomeState extends State<_Home> {
  int _i = 0;
  final _pages = const [TasksPage(), ProductsPage(), RegisterPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task&Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeController>().toggle(),
          ),
        ],
      ),
      body: _pages[_i],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _i,
        onDestinationSelected: (v)=>setState(()=>_i=v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.checklist), label: 'Tarefas'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Produtos'),
          NavigationDestination(icon: Icon(Icons.person_add), label: 'Cadastro'),
        ],
      ),
    );
  }
}
