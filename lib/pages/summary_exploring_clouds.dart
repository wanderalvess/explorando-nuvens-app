import 'package:flutter/material.dart';

class SummaryExploringCloudsPage extends StatelessWidget {
  final String imageUrl = 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg';

  const SummaryExploringCloudsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo sobre as Nuvens'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'O que são as nuvens?',
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(imageUrl, height:heightScreen, width: widthScreen), // Adicionando a imagem
                    const SizedBox(height: 10),
                    const Text(
                      'As nuvens são uma coleção visível de minúsculas gotas de água ou cristais de gelo que se encontram suspensos na atmosfera acima da superfície da Terra. Elas desempenham um papel crucial no sistema climático, ajudando a regular a temperatura do planeta e a distribuir a água na forma de precipitação.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Formação das nuvens',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'As nuvens se formam quando o ar quente sobe e se expande na atmosfera. À medida que o ar sobe, ele esfria, e o vapor d\'água nele contido condensa em pequenas gotas de água ou cristais de gelo. Esse processo é facilitado pela presença de partículas microscópicas no ar, como poeira, sal e fuligem, que servem como núcleos de condensação.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Composição das nuvens',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'A composição das nuvens varia de acordo com a altitude e a temperatura. As nuvens mais baixas são geralmente compostas de gotas de água, enquanto as nuvens em altitudes mais elevadas podem conter cristais de gelo. Em alguns casos, as nuvens podem conter uma mistura de gotas de água e cristais de gelo. Além da água, as nuvens também contêm pequenas quantidades de outras substâncias, como sais marinhos e poeira, que atuam como núcleos de condensação.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
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
