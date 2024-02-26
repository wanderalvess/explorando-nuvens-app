import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String imageUrl;
  final String nameCloudType;
  final String descriptionCloudType;

  ImageDetailPage(
      {super.key,
      required this.imageUrl,
      required this.nameCloudType,
      required this.descriptionCloudType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover, // Para ajustar a imagem ao tamanho da tela
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
            padding: EdgeInsets.all(16), // Adicionando margem em todos os lados
            child: Text(
              descriptionCloudType,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
