import 'package:flutter/material.dart';
import '../../tasks/data/task_db.dart';
import '../../tasks/data/task_model.dart';
import 'task_form_dialog.dart';

class TasksPage extends StatefulWidget { const TasksPage({super.key}); @override State<TasksPage> createState()=>_TasksPageState(); }
class _TasksPageState extends State<TasksPage> {
  final db = TaskDb();
  late Future<List<Task>> _future;

  @override void initState(){ super.initState(); _future = db.all(); }
  Future<void> _reload() async => setState(()=>_future = db.all());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (c, snap){
        final items = snap.data ?? <Task>[];
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final title = await showDialog<String>(context: context, builder: (_) => const TaskFormDialog());
              if (title != null && title.trim().isNotEmpty) {
                await db.insert(Task(title: title));
                _reload();
              }
            },
            child: const Icon(Icons.add),
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, i){
              final t = items[i];
              return Dismissible(
                key: ValueKey(t.id),
                onDismissed: (_) async { await db.delete(t.id!); _reload(); },
                background: Container(color: Colors.red),
                child: CheckboxListTile(
                  value: t.done,
                  title: Text(t.title),
                  onChanged: (v) async {
                    await db.update(Task(id: t.id, title: t.title, done: v??false));
                    _reload();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
