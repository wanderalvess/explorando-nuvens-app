import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String imageUrl;
  final String nameCloudType;
  final String titleCloudType;
  final String descriptionCloudType;

  ImageDetailPage(
      {super.key,
      required this.imageUrl,
      required this.nameCloudType,
      required this.titleCloudType,
      required this.descriptionCloudType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            nameCloudType,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              descriptionCloudType,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 8),
          const Text(
            'Fonte: International Cloud Atlas',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
