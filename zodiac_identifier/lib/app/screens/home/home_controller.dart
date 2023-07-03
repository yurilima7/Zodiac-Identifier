import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zodiac_identifier/app/repositories/constellation_repository.dart';
import 'package:zodiac_identifier/app/screens/home/home_state.dart';
import 'dart:io';

class HomeController extends Cubit<HomeState> {
  final ConstellationRepository _constellationRepository;

  HomeController(this._constellationRepository)
      : super(const HomeState.initial());

  Future<void> identify(String img) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final constellation =
          await _constellationRepository.loadConstellation(img);

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          constellation: constellation,
        ),
      );
    } catch (e, s) {
      log('Erro ao identificar', error: e, stackTrace: s);
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Erro ao identificar',
      ));
    }
  }

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 640,
        maxWidth: 640,
      );

      if (image == null) return;

      final imageTemp = File(image.path);

      final encode = encodeImage(imageTemp.path);

      emit(state.copyWith(
        status: HomeStatus.loadedImage,
        galleryFile: imageTemp,
        encodeImage: encode,
      ));
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');

      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Falha ao buscar imagem da galeria',
      ));
    }
  }

  String encodeImage(String imagePath) {
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String encodedImage = base64Encode(imageBytes);
    return encodedImage;
  }
}
