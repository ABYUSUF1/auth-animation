import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  // fieldName is the name of the field
  final String fieldName;

  // hintText is the hint text of the field
  final String hintText;

  // Each TextFormField has it's own controller
  final TextEditingController controller;

  // suffix icon for textfield
  final IconData icon;

  const CustomTextFormField(
      {super.key,
      required this.fieldName,
      required this.hintText,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildFieldName(size: size),
        _buildTextFormField(size: size)
      ],
    );
  }

  Text _buildFieldName({required Size size}) {
    return Text(fieldName, style: TextStyle(fontSize: size.height / 55));
  }

  TextFormField _buildTextFormField({required Size size}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: size.height / 80, fontWeight: FontWeight.bold),
      onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: size.height / 80, color: Colors.grey[400]),
        contentPadding: EdgeInsets.symmetric(
          horizontal: size.width / 30,
          vertical: size.height / 50,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(
            size.height / 70,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.height / 70),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
