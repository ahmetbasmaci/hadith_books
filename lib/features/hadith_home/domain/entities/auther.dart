class Auther {
  int id;
  String name;
  int birthDateHijri;
  int deathDateHijri;
  String description;

  Auther({
    required this.id,
    required this.name,
    required this.birthDateHijri,
    required this.deathDateHijri,
    required this.description,
  });

  factory Auther.fromJson(Map<String, dynamic> json) {
    return Auther(
      id: json['id'],
      name: json['name'],
      birthDateHijri: int.tryParse(json['birthDateHijri']??"0")??0,
      deathDateHijri: int.tryParse(json['deathDateHijri']??"0")??0,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'birthDateHijri': birthDateHijri,
      'deathDateHijri': deathDateHijri,
      'description': description,
    };
  }
}
