import 'package:flutter/material.dart';
import 'package:zodiac_identifier/app/core/ui/styles/text_app.dart';

class Button extends StatelessWidget {
  final VoidCallback? function;
  final String title;

  const Button({
    super.key,
    this.function,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(title, style: context.text.titleButton,),
    );
  }
}
