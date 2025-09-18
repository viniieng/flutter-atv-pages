import 'package:flutter/material.dart';

class ServiceHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> history = [
    {'service': 'Corte Masculino', 'date': '12/09/2025'},
    {'service': 'Barba', 'date': '30/08/2025'},
    {'service': 'Coloração', 'date': '15/08/2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Serviços')),
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: history.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final item = history[index];
          return ListTile(
            leading: Icon(Icons.history),
            title: Text(item['service']!),
            subtitle: Text('Data: ${item['date']}'),
          );
        },
      ),
    );
  }
}
