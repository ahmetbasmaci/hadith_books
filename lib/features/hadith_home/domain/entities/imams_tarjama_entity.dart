import 'package:equatable/equatable.dart';

class ImamsTarjamaEntity extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final int birthDateHijri;
  final int deathDateHijri;
  final String descriptionAr;
  final String descriptionEn;

  const ImamsTarjamaEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.birthDateHijri,
    required this.deathDateHijri,
    required this.descriptionAr,
    required this.descriptionEn,
  });

  //add fromJson
  factory ImamsTarjamaEntity.fromJson(Map<String, dynamic> json) {
    return ImamsTarjamaEntity(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      birthDateHijri: int.parse(json['birthDateHijri'] ?? "0"),
      deathDateHijri: int.parse(json['deathDateHijri'] ?? "0"),
      descriptionAr: json['descriptionAr'],
      descriptionEn: json['descriptionEn'],
    );
  }

  @override
  List<Object?> get props => [id, birthDateHijri, deathDateHijri, descriptionAr, descriptionEn];
}
