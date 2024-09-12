import 'package:explorando_clima_app/pages/cloud_types_page.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_widget.dart';
import 'package:flutter/material.dart';

class ExploringTypeCloudsPage extends StatelessWidget {
  const ExploringTypeCloudsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Nuvens'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 669) {
              return ListView.builder(
                itemCount: cloudData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildCloudCard(context, index),
                  );
                },
              );
            } else if (constraints.maxWidth >=  670 && constraints.maxWidth <= 1130) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: BorderSide.strokeAlignOutside,
                ),
                itemCount: cloudData.length,
                itemBuilder: (context, index) {
                  return buildCloudCard(context, index);
                },
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: BorderSide.strokeAlignOutside,
                ),
                itemCount: cloudData.length,
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
            builder: (context) => CloudTypesPage(
              nameCloudType: cloudData[index]['name']!,
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
                cloudData[index]['imageUrl']!,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cloudData[index]['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

const List<Map<String, String>> cloudData = [
  {
    'name': 'Cirrus',
    'imageUrl': 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
  },
  {
    'name': 'Stratus',
    'imageUrl': 'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
  },
  {
    'name': 'Cumulonimbus',
    'imageUrl': 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
  },
  {
    'name': 'Stratocumulus',
    'imageUrl': 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
  },
  {
    'name': 'Altocumulus',
    'imageUrl': 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
  },
  {
    'name': 'Cumulus',
    'imageUrl': 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
  },
  {
    'name': 'Altostratus',
    'imageUrl': 'https://i.postimg.cc/Mfqh2ftV/Altostratus.jpg',
  },
  {
    'name': 'Cirrocumulus',
    'imageUrl': 'https://i.postimg.cc/MXwTKsFb/Cirrocumulus.jpg',
  },
  {
    'name': 'Cirrostratus',
    'imageUrl': 'https://i.postimg.cc/m25tXQ3X/Cirrostratus.jpg',
  },
  {
    'name': 'Nimbostratus',
    'imageUrl': 'https://i.postimg.cc/prfm4CZc/Nimbostratus.jpg',
  },
];
