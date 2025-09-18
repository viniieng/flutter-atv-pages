import 'package:flutter/material.dart';
import '../models/professional.dart';

class ProfessionalCard extends StatelessWidget {
  final Professional professional;
  final VoidCallback? onTap;

  const ProfessionalCard({required this.professional, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(professional.photoUrl),
          radius: 28,
        ),
        title: Text(professional.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(professional.specialty),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text(professional.rating.toString()),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
