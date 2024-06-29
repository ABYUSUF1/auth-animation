import 'package:flutter/material.dart';

class CustomOrLine extends StatelessWidget {
  const CustomOrLine({super.key});

  static final Expanded _divider = Expanded(
      child: Divider(
    height: 0.5,
    color: Colors.grey[300],
  ));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _divider,
        Text(
          '    OR    ',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 80,
              color: Colors.grey[300]),
        ),
        _divider,
      ],
    );
  }
}
