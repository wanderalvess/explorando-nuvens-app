import 'package:flutter/cupertino.dart';

class ScreenHeaderText extends StatelessWidget {
  const ScreenHeaderText({required this.titleText, Key? key}) : super(key: key);
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
