import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [
    {'sender': 'professional', 'text': 'Olá! Como posso ajudar você?'},
    {'sender': 'user', 'text': 'Quero agendar um corte para amanhã.'},
  ];

  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;
    setState(() {
      messages.add({'sender': 'user', 'text': messageController.text.trim()});
      messageController.clear();
      // Resposta automática simulada
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          messages.add({'sender': 'professional', 'text': 'Perfeito! Qual horário prefere?'});
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat com Profissional'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                bool isUser = msg['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.brown[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(msg['text']!),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Digite uma mensagem',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: sendMessage,
                    color: Colors.brown,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
