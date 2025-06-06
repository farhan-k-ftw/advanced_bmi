import 'package:flutter/material.dart';

class iconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const iconWithLabel({
    required this.icon,required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(
            icon,
            size: 80,
          ),
        ),
        Container(
          child: Text(label),
        ),
      ],
    );
  }
}