import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  const TopTitles({super.key, required this.subtitle, required this.title});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight + 12,
        ),
        if (title == 'Login' || title == 'Create Account')
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }
}
