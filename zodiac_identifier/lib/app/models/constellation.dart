import 'dart:convert';

class Constellation {
  final String nameEn;
  final String nameBr;
  final String percentage;

  Constellation({
    required this.nameEn,
    required this.nameBr,
    required this.percentage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameEn': nameEn,
      'nameBr': nameBr,
      'percentage': percentage,
    };
  }

  factory Constellation.fromMap(Map<String, dynamic> map) {
    return Constellation(
      nameEn: map['nameEn'] ?? '',
      nameBr: map['nameBr'] ?? '',
      percentage: map['percentage'] ?? '', 
    );
  }

  String toJson() => json.encode(toMap());

  factory Constellation.fromJson(String source) =>
      Constellation.fromMap(json.decode(source) as Map<String, dynamic>);
}
