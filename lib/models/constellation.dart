import 'dart:convert';

import 'package:genshin_app/models/enum.dart';

class Constellation {
  String name;
  ConstellationUnlock unlock;
  String description;
  int? level;

  Constellation({
    required this.name,
    required this.unlock,
    required this.description,
    this.level,
  });

  factory Constellation.fromRawJson(String str) =>
      Constellation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Constellation.fromJson(Map<String, dynamic> json) => Constellation(
        name: json["name"],
        unlock: constellationUnlockValues.map[json["unlock"]]!,
        description: json["description"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": constellationUnlockValues.reverse[unlock],
        "description": description,
        "level": level,
      };
}
