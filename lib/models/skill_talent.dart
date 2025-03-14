import 'package:genshin_app/models/attribute_scaling.dart';

class SkillTalent {
  String name;
  String unlock;
  String description;
  List<AttributeScaling> upgrades;
  String type;
  List<AttributeScaling> attributeScaling;

  SkillTalent({
    required this.name,
    required this.unlock,
    required this.description,
    required this.upgrades,
    required this.type,
    required this.attributeScaling,
  });

  factory SkillTalent.fromJson(Map<String, dynamic> json) => SkillTalent(
        name: json["name"],
        unlock: json["unlock"],
        description: json["description"],
        upgrades: List<AttributeScaling>.from(
            json["upgrades"].map((x) => AttributeScaling.fromJson(x))),
        type: json["type"],
        attributeScaling: List<AttributeScaling>.from(
            json["attribute-scaling"].map((x) => AttributeScaling.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": unlock,
        "description": description,
        "upgrades": List<dynamic>.from(upgrades.map((x) => x.toJson())),
        "type": type,
        "attribute-scaling":
            List<dynamic>.from(attributeScaling.map((x) => x.toJson())),
      };
}
