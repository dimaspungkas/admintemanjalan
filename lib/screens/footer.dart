import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 60,
      child: const Center(
        child: Text(
          '2024 \u00a9 Teman Jalan',
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
