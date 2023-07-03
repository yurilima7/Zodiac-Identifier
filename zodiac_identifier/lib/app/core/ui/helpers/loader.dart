import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zodiac_identifier/app/core/ui/styles/colors_app.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;

      showDialog(
        context: context,
        builder: (context) => LoadingAnimationWidget.inkDrop(
          color: ColorsApp.i.primary,
          size: 60,
        ),
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
    }
    Navigator.of(context).pop();
  }
}