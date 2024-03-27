import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao Explorando o Clima!',
              style: TextStyle( fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Este aplicativo foi desenvolvido para ajudar você a compreender e identificar os diferentes aspectos do clima.',
              textAlign: TextAlign.justify,
              style: TextStyle( fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'O aplicativo abrange uma variedade de recursos, incluindo a identificação de tipos de nuvens, análise de fatores climáticos, previsão do tempo e exploração de fenômenos climáticos.',
              textAlign: TextAlign.justify,
              style: TextStyle( fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Não esqueça de ler nossos termos de uso e políticas de privacidade para garantir uma experiência segura e confiável.',
              textAlign: TextAlign.justify,
              style: TextStyle( fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
