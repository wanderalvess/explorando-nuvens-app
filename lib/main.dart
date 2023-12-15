import 'package:clouds_identification_tab/model/my_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identificando Nuvens'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Mostrar o menu sanduíche
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0), // Adicione margens iguais à esquerda e à direita
        child: Wrap(
          spacing: 22.0, // Espaçamento horizontal entre os botões
          runSpacing: 10.0, // Espaçamento vertical entre as linhas
          children: <Widget>[
            CloudCategoryButton(
              categoryName: 'Cirrus',
              categoryImage: 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Cumulus',
              categoryImage: 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Stratus',
              categoryImage: 'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Altocumulus',
              categoryImage: 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Cumulonimbus',
              categoryImage: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Stratocumulus',
              categoryImage: 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class CloudCategoryButton extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  CloudCategoryButton({required this.categoryName, required this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CloudTypesPage(categoryName: categoryName),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network(
              categoryImage,
              fit: BoxFit.cover,
            ),
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}


class CloudTypesPage extends StatefulWidget {
  final String categoryName;

  CloudTypesPage({required this.categoryName});

  @override
  _CloudTypesPageState createState() => _CloudTypesPageState();
}

class _CloudTypesPageState extends State<CloudTypesPage> {
  // Lista de URLs de imagens com base na categoria selecionada
  List<MyImage> imageUrls = [];

  @override
  void initState() {
    super.initState();
    // Simule a busca de URLs de imagens com base na categoria selecionada
    fetchImageUrls(widget.categoryName);
  }

  Future<void> fetchImageUrls(String categoryName) async {
    final response = await http.get(Uri.parse('http://192.168.0.116:8080/image/images?category=$categoryName'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MyImage> urls = data.map((item) {

        return MyImage(item['imageUrl']!, item['description']!, item['title']);
      }).toList();
      setState(() {
        imageUrls = urls;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de nuvens - ${widget.categoryName}'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Defina o número de colunas desejado
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ImageDetailPage(imageUrl: imageUrls[index].getUrl),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      imageUrls[index].getUrl,
                      fit: BoxFit
                          .contain, // Controla o dimensionamento da imagem
                    ),
                  ),
                  ListTile(
                    title: Text(
                      imageUrls[index].getTitle,
                    ),
                    // Substitua pelo título real
                    subtitle: Text(
                      imageUrls[index].getDescription,
                    ),
                    // Substitua pela descrição real
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String imageUrl;

  ImageDetailPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem Detalhada'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
