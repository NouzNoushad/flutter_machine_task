import 'package:flutter/material.dart';

class UserCardStyling extends StatelessWidget {
  final String label;
  final String details;
  final double fontSize;
  final int flexStart;
  final int flexEnd;
  const UserCardStyling(
      {super.key,
      required this.label,
      required this.details,
      required this.fontSize,
      required this.flexStart,
      required this.flexEnd});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: flexStart,
          child: Text(
            '$label:',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: flexEnd,
          child: Text(
            details,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        )
      ],
    );
  }
}
