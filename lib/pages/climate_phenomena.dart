import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClimatePhenomena extends StatelessWidget {
  final String imageUrl = 'https://s5.static.brasilescola.uol.com.br/be/2022/09/formacao-furacao.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fenômenos climáticos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Fenômenos Climáticos',
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
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(imageUrl), // Adicionando a imagem
                    SizedBox(height: 18),
                    const Text(
                      'Os fenômenos climáticos apresentam ocorrência natural e são resultantes das dinâmicas da atmosfera. Alguns deles têm a sua ação intensificada em decorrência da ação antrópica, conforme veremos a seguir.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ciclones',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Formados em áreas de baixa pressão onde há grande instabilidade atmosférica decorrente do movimento de convergência e ascensão do ar quente. São chamados também de tempestade tropical. Ciclone é uma denominação genérica para tufões e furacões, que se diferenciam apenas quanto ao local de origem.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Tornados',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Colunas de ar que giram em alta velocidade ao redor de uma área de baixa pressão atmosférica e têm origem nas grandes nuvens de tempestade.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Ilha de Calor',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Acontece quando há a formação de uma área de maior temperatura nas cidades, tornando-as mais quentes do que as áreas circundantes.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'El Niño e la Niña',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Fenômenos climáticos associados ao aquecimento (El Niño) ou resfriamento (La Niña) anormal das águas do oceano Pacífico devido à mudança no nível da termoclina, que aprofunda a camada de águas mais frias ou provoca a sua ressurgência.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Fonte: Brasil Escola',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
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
