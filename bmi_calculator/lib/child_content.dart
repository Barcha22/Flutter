import 'package:flutter/material.dart';

class ChildContent extends StatelessWidget {
  const ChildContent({
    required this.icon,
    required this.label,
    super.key,
    required this.colourIcon,
  });

  final String label;
  final IconData icon;
  final Color colourIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //
      children: [
        Icon(
          icon,
          size: 80,
          color: colourIcon, //
        ),
        SizedBox(
          height: 15, //
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18, //
            color: Color(0xFF616272),
          ),
        ),
      ],
    );
  }
}
