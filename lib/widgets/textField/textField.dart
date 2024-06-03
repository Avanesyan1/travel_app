import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.onChanged,
    this.keyboardType

  });

  final String labelText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,),
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.07,
        child: TextField(
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400), // style from bf16w4
          controller: widget.controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            labelText: widget.labelText,
          ),
        ),
      ),
    );
  }
}
