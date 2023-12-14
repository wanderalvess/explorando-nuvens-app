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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CloudCategoryButton(
              categoryName: 'Nuvens Cirrus',
              categoryImage: 'https://i.postimg.cc/C54KNSmC/MG-3831.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Nuvens Cumulus',
              categoryImage: 'https://i.postimg.cc/VNP3YnY6/MG-3829.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Nuvens Stratus',
              categoryImage: 'https://i.postimg.cc/4yvrH3BG/MG-4210.jpg',
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
