import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    'Cortes',
    'Barba',
    'Coloração',
    'Tratamentos',
    'Estilo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias de Serviços'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: categories.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            leading: Icon(Icons.cut),
            title: Text(category),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/professionals', arguments: category);
            },
          );
        },
      ),
    );
  }
}
