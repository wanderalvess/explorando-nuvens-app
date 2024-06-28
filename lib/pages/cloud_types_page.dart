import 'dart:convert';

import 'package:explorando_clima_app/model/my_image.dart';
import 'package:explorando_clima_app/pages/image_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

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
        'https://explorando-nuvens.onrender.com/api/images/clouds?category=$nameCloudType'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MyImage> urls = data.map((item) {
        return MyImage(
            item['imageUrl'] ?? '',
            item['descriptionCloudType'] ?? '',
            item['nameCloudType'] ?? '',
            item['titleCloudType'] ?? '');
      }).toList();
      setState(() {
        imageUrls = urls;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de nuvens - ${widget.nameCloudType}'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: imageUrls.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailPage(
                            imageUrl: imageUrls[index].getUrl,
                            nameCloudType: imageUrls[index].getNameCloudType,
                            titleCloudType: imageUrls[index].getTitleCloudType,
                            descriptionCloudType:
                                imageUrls[index].getDescriptionCloudType,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.network(
                                imageUrls[index].getUrl,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              imageUrls[index].getTitleCloudType,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  aspectRatio: 1.20,
                  height: heightScreen,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  autoPlay: true,
                ),
              ),
            ),
    );
  }
}
