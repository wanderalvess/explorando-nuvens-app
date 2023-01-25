import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Mostrar o menu sanduíche
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Tipos de Nuvens'),
              onPressed: () {
                // Navegar para a página de tipos de nuvens
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CloudTypesPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CloudTypesPage extends StatefulWidget {
  @override
  _CloudTypesPageState createState() => _CloudTypesPageState();
}

class _CloudTypesPageState extends State<CloudTypesPage> {
  dynamic _clouds;

  @override
  void initState() {
    super.initState();
    _getClouds();
  }

  Future<void> _getClouds() async {
    final response = await http
        .get(Uri.parse('https://samsungportugal.com/fotografia-943km-iframe/'));
    if (response.statusCode == 200) {
      setState(() {
        _clouds = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load clouds');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de nuvens'),
      ),
      body: _clouds != null
          ? Center(
              child: Text(_clouds['name']),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
