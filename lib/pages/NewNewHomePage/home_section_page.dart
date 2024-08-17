import 'package:flutter/material.dart';

class HomeSectionPage extends StatelessWidget {
  final String title;
  final List<Widget> cards;

  const HomeSectionPage({Key? key, required this.title, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: cards,
        ),
      ),
    );
  }
}


Widget buildCard(BuildContext context, String text, IconData icon, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
