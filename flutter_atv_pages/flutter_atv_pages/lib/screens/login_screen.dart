import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login - Hub Barbearia')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Apenas navegação simulada
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                // Pode levar para cadastro ou outro lugar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cadastro não implementado')),
                );
              },
              child: Text('Criar conta'),
            )
          ],
        ),
      ),
    );
  }
}
