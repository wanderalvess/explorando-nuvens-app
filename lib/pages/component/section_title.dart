import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';
import 'package:flutter/cupertino.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.text, this.subtitle, Key? key})
      : super(key: key);
  final String text;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null && subtitle!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: const TextStyle(letterSpacing: -.25),
            )
          ]
        ],
      ),
    );
  }
}
