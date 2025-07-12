import 'package:flutter/material.dart';

class ChildContent extends StatelessWidget {
  ChildContent({required this.icon, required this.label});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white, //
        ),
        SizedBox(
          height: 15, //
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18, //
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
