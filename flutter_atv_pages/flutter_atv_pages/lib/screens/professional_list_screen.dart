import 'package:flutter/material.dart';
import '../models/professional.dart';
import '../widgets/professional_card.dart';

class ProfessionalListScreen extends StatelessWidget {
  final Map<String, List<Professional>> data = {
    'Cortes': [
      Professional(
          name: 'Carlos Silva',
          specialty: 'Corte Masculino',
          photoUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          rating: 4.8,
          description: 'Especialista em cortes clássicos e modernos.'),
      Professional(
          name: 'João Pedro',
          specialty: 'Corte Infantil',
          photoUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
          rating: 4.5,
          description: 'Cortes para todas as idades com paciência e carinho.'),
    ],
    'Barba': [
      Professional(
          name: 'Lucas Almeida',
          specialty: 'Barbeiro',
          photoUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          rating: 4.7,
          description: 'Especialista em barba e acabamento.'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context)?.settings.arguments as String? ?? 'Cortes';
    final List<Professional> professionals = data[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Profissionais - $category'),
      ),
      body: ListView.builder(
        itemCount: professionals.length,
        itemBuilder: (context, index) {
          final prof = professionals[index];
          return ProfessionalCard(
            professional: prof,
            onTap: () {
              Navigator.pushNamed(context, '/profile', arguments: prof);
            },
          );
        },
      ),
    );
  }
}
