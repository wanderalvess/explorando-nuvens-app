import 'package:clouds_identification_tab/pages/component/cloud_category_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploringClouds extends StatelessWidget {
  const ExploringClouds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorando Nuvens'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: Wrap(
          spacing: 22.0,
          runSpacing: 10.0,
          children: <Widget>[
            CloudCategoryButton(
              nameCloudType: 'Cirrus',
              categoryImage: 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
            ),
            CloudCategoryButton(
              nameCloudType: 'Cumulus',
              categoryImage: 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
            ),
            CloudCategoryButton(
              nameCloudType: 'Stratus',
              categoryImage: 'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
            ),
            CloudCategoryButton(
              nameCloudType: 'Altocumulus',
              categoryImage: 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
            ),
            CloudCategoryButton(
              nameCloudType: 'Cumulonimbus',
              categoryImage: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
            ),
            CloudCategoryButton(
              nameCloudType: 'Stratocumulus',
              categoryImage: 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
