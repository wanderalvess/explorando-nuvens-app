import 'package:flutter/material.dart';


class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text(
          'Termos de uso',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Antes de utilizar nossos serviços, pedimos que leia atentamente estes termos. Ao utilizar nosso aplicativo ou Site WEB, você concorda com estes termos.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Uso do Aplicativo ou Site WEB',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.1. Você concorda em utilizar este aplicativo ou versão web apenas para os fins previstos, ou seja, consultar dados referentes ao clima, '
                      'consultar imagens dos tipos de nuvens, consultar previsões do tempo e ao que esse aplicativo é proposto e explicado na aba Sobre esse Aplicativo.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.2. Você concorda em não utilizar este aplicativo ou versão web para qualquer atividade ilegal, fraudulenta, prejudicial ou não autorizada.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2. Propriedade Intelectual',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.1. Todos os direitos autorais, marcas registradas e outros direitos de propriedade intelectual relacionados ao aplicativo ou versão web são '
                      'de propriedade exclusiva do desenvolvedor.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.2. Você concorda em não reproduzir, distribuir, modificar ou criar obras derivadas com base no conteúdo deste aplicativo ou versão web sem '
                      'autorização prévia por escrito.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '3. Limitação de Responsabilidade',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3.1. O uso deste aplicativo ou versão web é por sua conta e risco. Não nos responsabilizamos por quaisquer danos diretos, indiretos, incidentais, '
                      'consequenciais ou especiais resultantes do uso ou da incapacidade de usar este aplicativo ou versão web.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3.2. Não garantimos que o aplicativo ou versão web esteja livre de erros ou que funcione sem interrupções.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '4. Alterações nos Termos de Uso',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4.1. Reservamo-nos o direito de modificar estes termos a qualquer momento, mediante aviso prévio.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4.2. O uso continuado do aplicativo ou versão web após a publicação das modificações constitui sua aceitação dos termos revisados.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ao utilizar este aplicativo ou versão web, você concorda com estes termos de uso. Se não concordar com estes termos, por favor, não utilize nosso aplicativo ou versão web.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
