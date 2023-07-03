import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:zodiac_identifier/app/models/constellation.dart';

part 'home_state.g.dart';

@match
enum HomeStatus {
  initial,
  loadedImage,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String? errorMessage;
  final Constellation? constellation;
  final File? galleryFile;
  final String? encodeImage;
  final String? pathImage;

  const HomeState({
    required this.status,
    this.errorMessage,
    this.constellation,
    this.galleryFile,
    this.encodeImage,
    this.pathImage,
  });

  @override
  List<Object?> get props => [status, errorMessage];

  const HomeState.initial()
      : status = HomeStatus.initial,
        errorMessage = null,
        constellation = null,
        galleryFile = null,
        encodeImage = null,
        pathImage = null;

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    Constellation? constellation,
    File? galleryFile,
    String? encodeImage,
    String? pathImage,
  }) {
    if (status == HomeStatus.loadedImage) {
      return HomeState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        constellation: null,
        galleryFile: galleryFile ?? this.galleryFile,
        encodeImage: encodeImage ?? this.encodeImage,
        pathImage: pathImage ?? this.pathImage,
      );
    }

    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      constellation: constellation ?? this.constellation,
      galleryFile: galleryFile ?? this.galleryFile,
      encodeImage: encodeImage ?? this.encodeImage,
      pathImage: pathImage ?? this.pathImage,
    );
  }
}
