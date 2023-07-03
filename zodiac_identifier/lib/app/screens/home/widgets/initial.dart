import 'package:flutter/material.dart';
import 'package:zodiac_identifier/app/core/ui/styles/text_app.dart';

class Initial extends StatelessWidget {
  final VoidCallback? function;

  const Initial({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: function,
            child: Image.asset(
              'assets/images/gallery.png',
              height: 80,
            ),
          ),
      
          const SizedBox(
            height: 6,
          ),
      
           Text(
              'Clique no ícone para adicionar uma imagem',
              style: context.text.primaryRegular,
            ),
        ],
      ),
    );
  }
}
