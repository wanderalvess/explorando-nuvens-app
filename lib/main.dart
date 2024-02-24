import 'package:flutter/material.dart';
import 'package:clouds_identification_tab/pages/about_page.dart';
import 'package:clouds_identification_tab/pages/component/cloud_category_button.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorando Nuvens'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Sobre o Aplicativo'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: Wrap(
          spacing: 22.0,
          runSpacing: 10.0,
          children: <Widget>[
            CloudCategoryButton(
              categoryName: 'Cirrus',
              categoryImage: 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Cumulus',
              categoryImage: 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Stratus',
              categoryImage: 'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Altocumulus',
              categoryImage: 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Cumulonimbus',
              categoryImage: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
            ),
            CloudCategoryButton(
              categoryName: 'Stratocumulus',
              categoryImage: 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
