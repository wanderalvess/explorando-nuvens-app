import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/cloud_types_page.dart';

class LargeTitledImageWidget extends StatelessWidget {
  final String text;
  final String imageUrl;

  const LargeTitledImageWidget({
    Key? key,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CloudTypesPage(nameCloudType: text),
          ),
        );
      },
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 160,
            height: 160,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
