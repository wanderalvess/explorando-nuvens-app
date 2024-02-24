import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o Aplicativo'),
      ),
      body: Center(
        child: Text(
          'Esta é a página "Sobre o Aplicativo".',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
