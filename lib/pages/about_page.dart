import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bem-vindo ao Explorando o Clima!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Essa plataforma é fruto e parte do meu projeto de trabalho de conclusão de curso e foi cuidadosamente desenvolvido com o objetivo de auxiliar você a entender e identificar uma ampla gama de aspectos climáticos.\n'
                      'Seja você um estudante, um entusiasta do clima ou um profissional da área, encontrará neste aplicativo uma ferramenta valiosa para aprofundar seu conhecimento sobre os diferentes fenômenos e elementos que compõem o clima.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      ' Nosso aplicativo oferece uma vasta gama de recursos para enriquecer sua experiência de aprendizagem sobre o clima.'
                      ' Você poderá identificar e estudar diferentes tipos de nuvens com base nas definições do Atlas Internacional de Nuvens, analisar fatores climáticos que influenciam o tempo, acessar previsões meteorológicas de várias cidades, '
                      'e explorar diversos fenômenos climáticos que ocorrem em todo o mundo. Com estes recursos, visamos proporcionar uma compreensão abrangente e aprofundada do clima',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Para garantir que sua experiência com nosso aplicativo seja segura e confiável, é fundamental que você leia atentamente nossos termos de uso e políticas de privacidade.\n'
                      'Essas informações são importantes para compreender como seus dados serão utilizados e protegidos, além de esclarecer as responsabilidades e direitos tanto dos usuários quanto do desenvolvedor.\n'
                      'Assim, você pode desfrutar de todas as funcionalidades do aplicativo com a tranquilidade de saber que sua privacidade está resguardada.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 22),
                    Text(
                      'Autor do Trabalho: Wanderson Alves Santos\n'
                      'Projeto de Trabalho de Conclusão de Curso: Curso de Graduação em Geografia – Licenciatura, do Instituto de Estudos Socioambientais da Universidade Federal de Goiás - UFG\n'
                      'Orientadora: Profa. Dra. Juliana Ramalho Barros.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
