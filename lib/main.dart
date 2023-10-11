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
        title: Text('Home'),
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
            ElevatedButton(
              child: Text('Nuvens Cirrus'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CloudTypesPage('cirrus')),
                );
              },
            ),
            ElevatedButton(
              child: Text('Nuvens Cumulus'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CloudTypesPage('cumulus')),
                );
              },
            ),
            ElevatedButton(
              child: Text('Nuvens Stratus'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CloudTypesPage('stratus')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CloudTypesPage extends StatefulWidget {
  final String category;

  CloudTypesPage(this.category);

  @override
  _CloudTypesPageState createState() => _CloudTypesPageState();
}

class _CloudTypesPageState extends State<CloudTypesPage> {
  // Lista de URLs de imagens com base na categoria selecionada
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    // Simule a busca de URLs de imagens com base na categoria selecionada
    fetchImageUrls(widget.category);
  }

  Future<void> fetchImageUrls(String category) async {
    final response = await http.get(Uri.parse('http://localhost:8080/images?category=$category'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> urls = data.map((item) {
        return item['imageUrl'] as String; // Converte explicitamente para String
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
        title: Text('Tipos de nuvens - ${widget.category}'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailPage(imageUrl: imageUrls[index]),
                ),
              );
            },
            child: Container(
              height: 200, // Altura fixa para não estourar a tela
              child: Image.network(imageUrls[index]),
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
