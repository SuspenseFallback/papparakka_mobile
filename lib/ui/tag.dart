import 'package:flutter/material.dart';

class UITag extends StatelessWidget {
  const UITag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), color: Colors.orange),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 3.0, left: 8.0, right: 8.0, bottom: 3.0),
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ));
  }
}
