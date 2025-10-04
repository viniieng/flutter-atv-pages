import 'package:flutter/material.dart';
class TaskFormDialog extends StatefulWidget { const TaskFormDialog({super.key}); @override State<TaskFormDialog> createState()=>_TaskFormDialogState(); }
class _TaskFormDialogState extends State<TaskFormDialog>{
  final ctrl = TextEditingController();
  @override Widget build(BuildContext context){
    return AlertDialog(
      title: const Text('Nova tarefa'),
      content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Título')),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('Cancelar')),
        FilledButton(onPressed: ()=>Navigator.pop(context, ctrl.text), child: const Text('Salvar')),
      ],
    );
  }
}
