import 'package:clouds_identification_tab/pages/component/cloud_category_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploringCloudsPage extends StatelessWidget {
  const ExploringCloudsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de Nuvens'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCloudCard(
                    name: 'Cirrus',
                    imageUrl: 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
                  ),
                  buildCloudCard(
                    name: 'Stratus',
                    imageUrl:
                        'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
                  ),
                ],
              ),
              SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCloudCard(
                    name: 'Cumulonimbus',
                    imageUrl: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
                  ),
                  buildCloudCard(
                    name: 'Stratocumulus',
                    imageUrl: 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
                  ),
                ],
              ),
              SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCloudCard(
                    name: 'Altocumulus',
                    imageUrl: 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
                  ),
                  buildCloudCard(
                    name: 'Cumulus',
                    imageUrl: 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCloudCard({required String name, required String imageUrl}) {
    return Card(
      elevation: 2,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: CloudCategoryButton(
          nameCloudType: name,
          categoryImage: imageUrl,
        ),
      ),
    );
  }
}
