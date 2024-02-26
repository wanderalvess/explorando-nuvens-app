import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Política de Privacidade',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
                  'Esta Política de Privacidade descreve como as informações pessoais são coletadas, usadas e compartilhadas quando você utiliza o aplicativo de Explorando Nuvens',
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
                      '1. Informações Coletadas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.1. Ao se cadastrar no aplicativo, coletamos as seguintes informações pessoais:',
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('- Nome'),
                          Text('- Endereço de e-mail'),
                          Text('- Senha (criptografada)'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.2. Também podemos coletar informações automaticamente sobre o dispositivo móvel, incluindo o modelo do dispositivo, sistema operacional, endereço IP, identificadores de dispositivo exclusivos e informações sobre a rede móvel.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2. Uso das Informações',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.1. As informações pessoais fornecidas são utilizadas para criar e gerenciar sua conta, fornecer acesso aos serviços do aplicativo e personalizar sua experiência.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2.2. Podemos usar as informações coletadas automaticamente para melhorar e otimizar o aplicativo, além de garantir a segurança e a integridade dos nossos serviços.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '3. Compartilhamento de Informações',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3.1. Não compartilhamos suas informações pessoais com terceiros, exceto nas seguintes circunstâncias:',
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '- Quando necessário para cumprir uma obrigação legal ou regulatória.'),
                          Text(
                              '- Com prestadores de serviços terceirizados que nos auxiliam na operação do aplicativo, como provedores de hospedagem, processamento de pagamentos e serviços de análise.'),
                          Text(
                              '- Com seu consentimento ou conforme indicado no momento da coleta das informações.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '4. Armazenamento de Dados',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4.1. As informações pessoais são armazenadas em servidores seguros e protegidas por medidas de segurança adequadas para evitar acesso não autorizado, uso indevido ou alteração das informações.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '5. Seus Direitos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '5.1. Você tem o direito de acessar, corrigir ou excluir suas informações pessoais a qualquer momento. Você também pode optar por sair do aplicativo ou solicitar a exclusão de sua conta entrando em contato conosco.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '6. Menores de Idade',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '6.1. Este aplicativo não é direcionado a menores de 13 anos e não coletamos intencionalmente informações pessoais de crianças menores de 13 anos. Se você acredita que coletamos informações de uma criança menor de 13 anos, entre em contato conosco para que possamos remover prontamente tais informações.',
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ao utilizar este aplicativo, você concorda com a coleta e uso de suas informações pessoais conforme descrito nesta Política de Privacidade. Se tiver dúvidas ou preocupações sobre nossas práticas de privacidade, entre em contato conosco.',
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
