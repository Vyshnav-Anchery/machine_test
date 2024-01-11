import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController texteditingController;
  final String hintText;
  final bool? disabled;
  final bool isName;
  final Function(String)? onSubmitted;
  const CustomFormField(
      {super.key,
      this.onSubmitted,
      this.isName = false,
      required this.hintText,
      required this.texteditingController,
      this.disabled});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: texteditingController,
      keyboardType: isName ? TextInputType.name : TextInputType.phone,
      decoration: InputDecoration(
        disabledBorder: const OutlineInputBorder(),
        enabled: disabled ?? true,
        border: const OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }
}
