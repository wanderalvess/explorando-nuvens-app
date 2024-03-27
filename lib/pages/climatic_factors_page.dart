import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClimaticFactorsPage extends StatelessWidget {
  final String imageUrl = 'https://i.pinimg.com/736x/4d/23/b0/4d23b0bea1e52906baa05093bdab6590.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fatores Climáticos'),
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
                  'Fatores Climáticos',
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
                    SizedBox(height: 18),
                    const Text(
                      'Os fatores do clima são elementos capazes de determinar ou alterar o comportamento dos elementos climáticos.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Latitude',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'A radiação solar incide de forma irregular sobre o planeta Terra, formando diferentes zonas térmicas, que são delimitadas por meio dos paralelos notáveis. Assim, a latitude de uma determinada região interfere diretamente no calor que ela recebe e, por conseguinte, nas temperaturas do clima. Os climas mais quentes se localizam nas áreas mais próximas do Equador, enquanto os polos abrigam as regiões de clima mais frio.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Altitude',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'A elevação de uma área com relação ao nível do mar pode alterar aspectos como a pressão atmosférica e a temperatura, condicionando particularidades ao clima. É importante notar que a influência da altitude sobre os elementos do clima sobrepõe a influência da latitude. Por exemplo: mesmo próximo do Equador, as cidades situadas no norte da América Andina apresentam climas mais frios em razão de sua elevada altitude.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Maritimidade e Continentalidade',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Maior proximidade (maritimidade) ou o afastamento (continentalidade) dos mares e oceanos é capaz de afetar a umidade do ar e a temperatura de uma determinada localidade.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Relevo',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'As formas de relevo afetam a maneira como o ar circula em uma determinada região, o que determina diferentes padrões de distribuição de umidade e a ocorrência de chuvas e ventos.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Massas de Ar',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'As grandes porções de ar que se movimentam pelo planeta carregam as características das áreas onde se formam, ocasionando variações na temperatura e na umidade dos locais por onde passam.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Corretes de Marítimas',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'As águas que se deslocam pelos oceanos são responsáveis por alterações na temperatura e no teor de umidade das áreas costeiras.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Vegetação',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'A presença ou ausência de cobertura vegetal influencia diretamente no teor de umidade de uma região, uma vez que as plantas são responsáveis pela evapotranspiração, o que afeta também as temperaturas.',
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
