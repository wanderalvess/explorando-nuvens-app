import 'package:flutter/material.dart';


class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Termos de uso',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bem-vindo ao aplicativo Explorando Nuvens! Antes de utilizar nossos serviços, pedimos que leia atentamente estes termos. Ao utilizar nosso aplicativo, você concorda com estes termos.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Cadastro e Informações Pessoais',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.1. Para utilizar os serviços deste aplicativo, é necessário se cadastrar fornecendo informações precisas e verdadeiras.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.2. As informações de cadastro obrigatórias incluem nome, endereço de e-mail e senha. Outras informações como data de aniversário, peso, altura, foto, sexo e qualquer outra informação pessoal são opcionais.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.3. Ao fornecer suas informações pessoais, você concorda que elas sejam armazenadas e processadas de acordo com nossa Política de Privacidade.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2. Uso do Aplicativo',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.1. Você concorda em utilizar este aplicativo apenas para os fins previstos, ou seja, registrar treinos de academia e acompanhar seu progresso pessoal.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.2. Você é responsável por manter a confidencialidade de sua senha e por todas as atividades que ocorram em sua conta.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.3. Você concorda em não utilizar este aplicativo para qualquer atividade ilegal, fraudulenta, prejudicial ou não autorizada.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '3. Propriedade Intelectual',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3.1. Todos os direitos autorais, marcas registradas e outros direitos de propriedade intelectual relacionados ao aplicativo são de propriedade exclusiva do desenvolvedor.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3.2. Você concorda em não reproduzir, distribuir, modificar ou criar obras derivadas com base no conteúdo deste aplicativo sem autorização prévia por escrito.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '4. Limitação de Responsabilidade',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4.1. O uso deste aplicativo é por sua conta e risco. Não nos responsabilizamos por quaisquer danos diretos, indiretos, incidentais, consequenciais ou especiais resultantes do uso ou da incapacidade de usar este aplicativo.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4.2. Não garantimos que o aplicativo esteja livre de erros ou que funcione sem interrupções.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '5. Alterações nos Termos de Uso',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '5.1. Reservamo-nos o direito de modificar estes termos a qualquer momento, mediante aviso prévio.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '5.2. O uso continuado do aplicativo após a publicação das modificações constitui sua aceitação dos termos revisados.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ao utilizar este aplicativo, você concorda com estes termos de uso. Se não concordar com estes termos, por favor, não utilize nosso aplicativo.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
