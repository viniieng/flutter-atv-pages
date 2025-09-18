import 'package:flutter/material.dart';
import '../models/professional.dart';

class ProfessionalProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Professional prof = ModalRoute.of(context)?.settings.arguments as Professional;

    return Scaffold(
      appBar: AppBar(
        title: Text(prof.name),
        actions: [
          IconButton(
            icon: Icon(Icons.schedule),
            onPressed: () => Navigator.pushNamed(context, '/schedule', arguments: prof),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(prof.photoUrl),
            ),
            SizedBox(height: 12),
            Text(prof.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(prof.specialty, style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 24),
                SizedBox(width: 6),
                Text(prof.rating.toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 16),
            Text(prof.description, style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/schedule', arguments: prof),
              icon: Icon(Icons.schedule),
              label: Text('Agendar Serviço'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
