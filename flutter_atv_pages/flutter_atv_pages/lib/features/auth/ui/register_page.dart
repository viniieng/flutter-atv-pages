import 'package:flutter/material.dart';
import '../../../services/firebase_bootstrap.dart';
import '../data/user_service.dart';

class RegisterPage extends StatefulWidget { const RegisterPage({super.key}); @override State<RegisterPage> createState()=>_RegisterPageState(); }
class _RegisterPageState extends State<RegisterPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  bool _ready = false;

  @override void initState(){ super.initState(); _bootstrap(); }
  Future<void> _bootstrap() async { await initFirebase(); setState(()=>_ready=true); }

  @override
  Widget build(BuildContext context) {
    if(!_ready) return const Center(child: CircularProgressIndicator());
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'Nome')),
          TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 12),
          FilledButton.icon(
            icon: const Icon(Icons.person_add),
            label: const Text('Cadastrar'),
            onPressed: () async {
              await UserService().register(name: name.text.trim(), email: email.text.trim());
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuário cadastrado!')));
              }
            },
          )
        ],
      ),
    );
  }
}
