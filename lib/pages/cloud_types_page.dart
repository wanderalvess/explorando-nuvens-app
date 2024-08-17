import 'dart:convert';
import 'package:explorando_clima_app/model/my_image.dart';
import 'package:explorando_clima_app/pages/image_detail_page.dart';
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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {

                  // Layout para telas maiores
                  if (constraints.maxWidth <= 600) {
                    return ListView.builder(
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return buildCloudCard(context, index);
                      },
                    );
                  } else if (constraints.maxWidth >= 601 &&
                      constraints.maxWidth <= 999) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 2,
                      ),
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return buildCloudCard(context, index);
                      },
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 2,
                      ),
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return buildCloudCard(context, index);
                      },
                    );
                  }
                },
              ),
            ),
    );
  }

  Widget buildCloudCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailPage(
              imageUrl: imageUrls[index].getUrl,
              nameCloudType: imageUrls[index].getNameCloudType,
              titleCloudType: imageUrls[index].getTitleCloudType,
              descriptionCloudType: imageUrls[index].getDescriptionCloudType,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrls[index].getUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    imageUrls[index].getTitleCloudType,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    imageUrls[index].getDescriptionCloudType,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
