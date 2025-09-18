import 'package:flutter/material.dart';
import '../models/professional.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  Professional? professional;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    professional = ModalRoute.of(context)?.settings.arguments as Professional?;

    return Scaffold(
      appBar: AppBar(title: Text('Agendar Serviço')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (professional != null)
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(professional!.photoUrl),
                  radius: 30,
                ),
                title: Text(professional!.name),
                subtitle: Text(professional!.specialty),
              ),
            SizedBox(height: 20),
            ListTile(
              title: Text(selectedDate == null
                  ? 'Selecionar data'
                  : 'Data: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (picked != null) setState(() => selectedDate = picked);
              },
            ),
            ListTile(
              title: Text(selectedTime == null
                  ? 'Selecionar horário'
                  : 'Horário: ${selectedTime!.format(context)}'),
              trailing: Icon(Icons.access_time),
              onTap: () async {
                TimeOfDay? picked =
                    await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (picked != null) setState(() => selectedTime = picked);
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: (selectedDate != null && selectedTime != null)
                  ? () {
                      Navigator.pushNamed(context, '/confirmation', arguments: {
                        'professional': professional,
                        'date': selectedDate,
                        'time': selectedTime,
                      });
                    }
                  : null,
              child: Text('Confirmar Agendamento'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
