import 'package:explorando_clima_app/pages/summary_exploring_clouds.dart';
import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/exploring_type_clouds_page.dart';

import 'component/cloud_types_list_component.dart';

class ExploringCloudsPage extends StatelessWidget {
  const ExploringCloudsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorando as Nuvens'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Nesta seção vamos explorar sobre as nuvens. Escolha uma das opções abaixo para começar sua exploração!',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SummaryExploringCloudsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.info, color: Colors.teal),
                    label: const Text('Resumo sobre Nuvens', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExploringTypeCloudsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.explore, color: Colors.teal),
                    label: const Text('Tipos de Nuvens', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
