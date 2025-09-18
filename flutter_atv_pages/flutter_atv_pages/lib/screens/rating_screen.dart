import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int selectedStars = 0;
  TextEditingController commentController = TextEditingController();

  Widget star(int index) {
    return IconButton(
      icon: Icon(
        index <= selectedStars ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 32,
      ),
      onPressed: () {
        setState(() {
          selectedStars = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar Serviço'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Avalie o profissional', style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) => star(i + 1)),
            ),
            TextField(
              controller: commentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Deixe um comentário (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedStars > 0 ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Avaliação enviada!')),
                );
                Navigator.pop(context);
              } : null,
              child: Text('Enviar Avaliação'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
