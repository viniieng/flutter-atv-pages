import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final List<String> options = [
    'Editar Perfil',
    'Notificações',
    'Privacidade',
    'Sair',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final option = options[index];
          return ListTile(
            title: Text(option),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$option clicado')));
              if (option == 'Sair') {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          );
        },
      ),
    );
  }
}
