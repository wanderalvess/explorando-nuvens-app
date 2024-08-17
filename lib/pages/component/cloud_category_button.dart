import 'package:explorando_clima_app/pages/cloud_types_page.dart';
import 'package:flutter/material.dart';

//não usado mais
class CloudCategoryButton extends StatelessWidget {
  final String nameCloudType;
  final String categoryImage;

  const CloudCategoryButton(
      {required this.nameCloudType, required this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CloudTypesPage(nameCloudType: nameCloudType),
          ),
        );
      },
      child: Column(
        children: [
          Image.network(
            categoryImage,
            fit: BoxFit.cover,
            width: 160,
            height: 160,
          ),
          const SizedBox(height: 8),
          Text(
            nameCloudType,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
