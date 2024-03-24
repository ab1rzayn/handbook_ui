import 'package:flutter/material.dart';


class ReportGenerateRowResult extends StatelessWidget {
  final String label;
  final String value;
  final Color textColor;

  ReportGenerateRowResult({required this.label, required this.value, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 14,
            color: textColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 14,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
