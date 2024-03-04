import 'dart:convert';

import 'package:clouds_identification_tab/model/my_image.dart';
import 'package:clouds_identification_tab/pages/image_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CloudTypesPage extends StatefulWidget {
  final String nameCloudType;

  CloudTypesPage({required this.nameCloudType});

  @override
  _CloudTypesPageState createState() => _CloudTypesPageState();
}

class _CloudTypesPageState extends State<CloudTypesPage> {
  List<MyImage> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImageUrls(widget.nameCloudType);
  }

  Future<void> fetchImageUrls(String nameCloudType) async {
    final response = await http.get(Uri.parse(
        'https://back-app-clouds.onrender.com/api/image/images?category=$nameCloudType'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MyImage> urls = data.map((item) {
        return MyImage(
            item['imageUrl'] ?? '',
            item['descriptionCloudType'] ?? '',
            item['nameCloudType'] ?? ''
        );
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
        title: Text('Tipos de nuvens - ${widget.nameCloudType}'),
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
                  builder: (context) => ImageDetailPage(
                    imageUrl: imageUrls[index].getUrl,
                    nameCloudType: imageUrls[index].getNameCloudType,
                    descriptionCloudType: imageUrls[index].getDescriptionCloudType,
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 135,
                    height: 135,
                    child: Image.network(
                      imageUrls[index].getUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      imageUrls[index].getNameCloudType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
