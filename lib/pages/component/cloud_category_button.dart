
import 'package:clouds_identification_tab/pages/cloud_types_page.dart';
import 'package:flutter/material.dart';

class CloudCategoryButton extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  CloudCategoryButton(
      {required this.categoryName, required this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CloudTypesPage(categoryName: categoryName),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network(
              categoryImage,
              fit: BoxFit.cover,
            ),
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}

