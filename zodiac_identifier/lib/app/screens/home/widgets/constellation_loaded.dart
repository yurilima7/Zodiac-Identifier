import 'package:flutter/material.dart';
import 'package:zodiac_identifier/app/core/ui/styles/colors_app.dart';
import 'package:zodiac_identifier/app/core/ui/styles/text_app.dart';
import 'dart:io';
import 'package:zodiac_identifier/app/models/constellation.dart';

class ConstellationLoaded extends StatelessWidget {
  final File image;
  final Constellation? constellation;
  final bool status;

  const ConstellationLoaded({
    super.key,
    required this.image,
    this.constellation,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return status ? Column(
      children: [
        const SizedBox(
          height: 32,
        ),

        Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.file(image, height: 320),
          ),
        ),

        const SizedBox(
          height: 29,
        ),

        constellation?.nameBr != null
          ? Text(
              constellation!.nameBr,
              style: context.text.titleConstellation,
          ) : const SizedBox.shrink(),

        const SizedBox(
          height: 17,
        ),

        constellation?.nameEn != null
          ? Align(
              alignment: Alignment.centerLeft,
              
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Constelação: ',
                      style: context.text.titleMedium.copyWith(color: context.colors.tertiary, fontSize: 18),
                    ),

                    TextSpan(
                      text: constellation!.nameEn,
                      style: context.text.titleMedium.copyWith(color: context.colors.secundary, fontSize: 18),
                    ),
                  ],
                ),
              ),
          )
          : const SizedBox.shrink(),

        const SizedBox(
          height: 6,
        ),

        constellation?.percentage != null
          ? Align(
            alignment: Alignment.centerLeft,
            
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Porcentagem: ',
                    style: context.text.titleMedium.copyWith(color: context.colors.tertiary, fontSize: 18),
                  ),

                  TextSpan(
                    text: constellation!.percentage,
                    style: context.text.titleMedium.copyWith(color: context.colors.secundary, fontSize: 18),
                  ),
                ],
              ),
            ),

          )
          : const SizedBox.shrink(),
      ],
    ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(
                'assets/images/error.png',
                height: 100,
              ),

              const SizedBox(
                height: 6,
              ),

              Text(
                'Não detectado',
                style: context.text.titleMedium,
              ),
            ],
          ),
        );
  }
}
