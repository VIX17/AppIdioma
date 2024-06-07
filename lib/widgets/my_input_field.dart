import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final bool isPasswordField;
  final String label;
  final String placeholder;
  final Function onChange;

  const MyInputField({
    Key? key,
    required this.placeholder,
    required this.label,
    this.isPasswordField = false,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 32,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            obscureText: isPasswordField,
            onChanged: (value) {
              this.onChange(value);
            },
            decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
