import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherClimate extends StatelessWidget {
  final String imageUrl = 'https://s3.static.brasilescola.uol.com.br/be/2022/09/paisagem-ceu-tempestuoso.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempo e Clima'),
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
                  'Quais as diferenças entre clima e tempo?',
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
                      'O tempo e o clima são frequentemente confundidos, e os termos são muito utilizados como sinônimos. Embora haja uma correlação entre o tempo e o clima, eles representam conceitos distintos, que se diferenciam sobretudo na sua abrangência temporal.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'O Tempo',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'É a condição da atmosfera e seus respectivos fenômenos em um determinado momento, isto é, corresponde à situação atual e tem uma duração curta. O tempo é, portanto, dinâmico e instável, podendo alterar rapidamente. Quando olhamos pela janela e dizemos que o dia está quente e ensolarado, por exemplo, estamos nos referindo ao tempo.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'O Clima',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Reúne as informações sobre as características atmosféricas de um local em um longo intervalo temporal. Podemos constatar, então, que o clima é resultante de uma análise cuidadosa e periódica do tempo atmosférico em uma determinada localidade. Esse período é de pelo menos 30 anos. Por essa razão, o Instituto Nacional de Pesquisas Espaciais (Inpe) define o clima como sendo o estado médio dos parâmetros do tempo',
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
