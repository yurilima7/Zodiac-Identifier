import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zodiac_identifier/app/core/dio/custom_dio.dart';
import 'package:zodiac_identifier/app/core/exceptions/repository_exception.dart';
import 'package:zodiac_identifier/app/models/constellation.dart';
import 'package:zodiac_identifier/app/repositories/constellation_repository.dart';

class ConstellationRepositoryImpl implements ConstellationRepository {
  final CustomDio dio;

  ConstellationRepositoryImpl({
    required this.dio,
  });

  @override
  Future<Constellation> loadConstellation(String img) async {
    try {
      final response = await dio.post('/detect', data: {"image": img});

      log('LOG: ${response.toString()}');
      return Constellation.fromMap(response.data);
    } on DioException catch (e, s) {
      log('Erro ao classificar', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao classificar');
    }
  }
}
