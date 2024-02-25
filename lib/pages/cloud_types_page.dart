
import 'dart:convert';

import 'package:clouds_identification_tab/model/my_image.dart';
import 'package:clouds_identification_tab/pages/image_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    final response = await http.get(Uri.parse(
        'https://back-app-clouds.onrender.com/api/image/images?category=$categoryName'));

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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
                    subtitle: Text(
                      imageUrls[index].getDescription,
                    ),
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
