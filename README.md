# Sobre o aplicativo
O aplicativo Tipos de Nuvens exibe diferentes tipos de nuvens com suas respectivas características. As imagens são carregadas de um servidor externo, então é necessário conexão com a internet para visualizá-las.

# Como executar o aplicativo
Para executar o aplicativo, basta clonar o repositório e executá-lo em um emulador ou dispositivo físico. O comando para clonar o repositório é:

> git clone https://github.com/seu_usuario/tipos-de-nuvens.git

Para executar o aplicativo, é necessário ter o Flutter instalado em sua máquina. Após a instalação, abra um terminal na pasta do projeto e execute o seguinte comando:

> flutter run

O comando acima irá baixar as dependências do projeto e executar o aplicativo em um dispositivo ou emulador conectado.

# Como gerar o arquivo APK

Para gerar o arquivo APK, execute o seguinte comando na pasta do projeto:

> flutter build apk

Esse comando irá gerar um arquivo `app-release.apk` na pasta `build\app\outputs\apk\release`. Esse arquivo pode ser instalado em dispositivos Android para testes ou distribuição do aplicativo.

Para gerar um arquivo APK assinado, é necessário criar uma chave de assinatura e modificar o arquivo `android/key.properties` com as informações da chave. Em seguida, execute o seguinte comando:

> flutter build apk --release

Esse comando irá gerar um arquivo APK assinado na pasta `build\app\outputs\apk\release`. Esse arquivo pode ser distribuído para usuários finais ou publicado na loja de aplicativos do Google Play.