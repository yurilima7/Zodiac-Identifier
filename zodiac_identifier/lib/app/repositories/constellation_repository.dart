import 'package:zodiac_identifier/app/models/constellation.dart';

abstract class ConstellationRepository {
  Future<Constellation> loadConstellation(String img);
}
