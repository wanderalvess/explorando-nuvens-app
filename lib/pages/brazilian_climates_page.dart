import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrazilianClimatesPage extends StatelessWidget {
  final String imageUrl = 'https://s1.static.brasilescola.uol.com.br/be/2021/10/mapa-climas-brasil.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Climas Brasileiros'),
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
                  'Climas do Brasil',
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
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(imageUrl), // Adicionando a imagem
                    SizedBox(height: 8),
                    const Text(
                      'O Brasil tem 93% de seu território localizado no Hemisfério Sul, o restante (7%) encontra-se no Hemisfério Norte, isso significa que o território está na zona intertropical do planeta, com exceção da região Sul.Em virtude da imensidão do território brasileiro (8 514 876 km²), são identificados diversos tipos de climas, sendo os principais: equatorial, tropical, tropical de altitude, tropical úmido, semiárido e subtropical.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Clima Equatorial',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'É identificado em quase todos os estados da região Norte, além de parte do Mato Grosso e Maranhão. Essa característica climática caracteriza-se pela elevada temperatura, grande umidade e baixa amplitude térmica, variando entre 24°C e 26°C ao ano. A quantidade de chuvas é abundante, com índices pluviométricos superiores a 2.000 mm, praticamente não são percebidos períodos de estiagem. A floresta Amazônica sofre influência desse clima.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Clima Tropical',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Influencia grande parte do centro do país, especialmente os estados do Centro-Oeste, incluindo ainda partes do Maranhão, Piauí, Ceará, Bahia e Minas Gerais. Em geral, as temperaturas são elevadas em boa parte do ano, com média de 24°C, e a amplitude térmica oscila entre 5°C e 6°C ao ano. A quantidade de chuvas gira em torno de 1 500 mm ao ano, com duas estações bem definidas: uma seca (maio a setembro) e outra chuvosa (outubro a abril).',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Clima Tropical de altitude',
                      style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Apresenta-se em regiões serranas e de planaltos, especialmente na região Sudeste. Nesses locais há baixa amplitude térmica, a temperatura média oscila entre 17°C e 22°C, e a quantidade chuvas é de 1.500 mm ao ano.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Clima Tropical Atlântico',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Ocorre, principalmente, no litoral oriental e sul do Brasil, sendo caracterizado pela alta temperatura e o elevado teor de umidade. As temperaturas médias anuais giram em torno de 25°C e os índices pluviométricos entre 1250 mm e 2.000mm',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Clima Semiárido',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'É típico da região Nordeste, especialmente no interior, lugar conhecido como polígono da seca, em razão da escassez de chuva. Apresenta temperaturas elevadas o ano todo, a média anual varia entre 26°C e 28°C. As chuvas são escassas, com uma média anual inferior a 750 mm, além disso, são mal distribuídas.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Clima Subtropical',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Ocorre unicamente na região Sul, essa característica climática distingue-se totalmente do restante do Brasil. As médias anuais de temperatura giram em torno de 18°C, com alta amplitude térmica. As chuvas são bem distribuídas, os índices pluviométricos superam os 1.250 mm ao ano.',
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
