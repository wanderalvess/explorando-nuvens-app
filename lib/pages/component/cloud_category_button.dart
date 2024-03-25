import 'package:clouds_identification_tab/pages/cloud_types_page.dart';
import 'package:flutter/material.dart';

class CloudCategoryButton extends StatelessWidget {
  final String nameCloudType;
  final String categoryImage;

  CloudCategoryButton(
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
          Container(
            width: 165,
            height: 165,
            child: Image.network(
              categoryImage,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            nameCloudType,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
