import 'dart:convert';

import 'package:genshin_app/models/enum.dart';
import 'package:genshin_app/models/upgrade.dart';

class SkillTalent {
  String name;
  SkillTalentUnlock unlock;
  String description;
  List<Upgrade> upgrades;
  Type? type;
  List<Upgrade>? attributeScaling;

  SkillTalent({
    required this.name,
    required this.unlock,
    required this.description,
    required this.upgrades,
    this.type,
    this.attributeScaling,
  });

  factory SkillTalent.fromRawJson(String str) =>
      SkillTalent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SkillTalent.fromJson(Map<String, dynamic> json) => SkillTalent(
        name: json["name"],
        unlock: skillTalentUnlockValues.map[json["unlock"]]!,
        description: json["description"],
        upgrades: List<Upgrade>.from(
            json["upgrades"].map((x) => Upgrade.fromJson(x))),
        type: typeValues.map[json["type"]]!,
        attributeScaling: json["attribute-scaling"] == null
            ? []
            : List<Upgrade>.from(
                json["attribute-scaling"]!.map((x) => Upgrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": skillTalentUnlockValues.reverse[unlock],
        "description": description,
        "upgrades": List<dynamic>.from(upgrades.map((x) => x.toJson())),
        "type": typeValues.reverse[type],
        "attribute-scaling": attributeScaling == null
            ? []
            : List<dynamic>.from(attributeScaling!.map((x) => x.toJson())),
      };
}
