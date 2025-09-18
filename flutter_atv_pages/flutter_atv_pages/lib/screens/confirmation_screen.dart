import 'package:flutter/material.dart';
import '../models/professional.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final Professional? professional = args?['professional'];
    final DateTime? date = args?['date'];
    final TimeOfDay? time = args?['time'];

    return Scaffold(
      appBar: AppBar(title: Text('Confirmação')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 16),
            Text('Agendamento Confirmado!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            if (professional != null) Text('Profissional: ${professional.name}'),
            if (date != null)
              Text('Data: ${date.day}/${date.month}/${date.year}'),
            if (time != null) Text('Horário: ${time.format(context)}'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: Text('Voltar para Home'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
