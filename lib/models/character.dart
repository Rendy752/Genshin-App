import 'dart:convert';

import 'package:genshin_app/models/ascension_materials.dart';
import 'package:genshin_app/models/constellation.dart';
import 'package:genshin_app/models/skill_talent.dart';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  String name;
  String title;
  String vision;
  String weapon;
  String gender;
  String nation;
  String affiliation;
  int rarity;
  DateTime release;
  String constellation;
  DateTime birthday;
  String description;
  List<SkillTalent> skillTalents;
  List<Constellation> passiveTalents;
  List<Constellation> constellations;
  String visionKey;
  String weaponType;
  AscensionMaterials ascensionMaterials;
  String id;

  Character({
    required this.name,
    required this.title,
    required this.vision,
    required this.weapon,
    required this.gender,
    required this.nation,
    required this.affiliation,
    required this.rarity,
    required this.release,
    required this.constellation,
    required this.birthday,
    required this.description,
    required this.skillTalents,
    required this.passiveTalents,
    required this.constellations,
    required this.visionKey,
    required this.weaponType,
    required this.ascensionMaterials,
    required this.id,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        title: json["title"],
        vision: json["vision"],
        weapon: json["weapon"],
        gender: json["gender"],
        nation: json["nation"],
        affiliation: json["affiliation"],
        rarity: json["rarity"],
        release: DateTime.parse(json["release"]),
        constellation: json["constellation"],
        birthday: DateTime.parse(json["birthday"]),
        description: json["description"],
        skillTalents: List<SkillTalent>.from(
            json["skillTalents"].map((x) => SkillTalent.fromJson(x))),
        passiveTalents: List<Constellation>.from(
            json["passiveTalents"].map((x) => Constellation.fromJson(x))),
        constellations: List<Constellation>.from(
            json["constellations"].map((x) => Constellation.fromJson(x))),
        visionKey: json["vision_key"],
        weaponType: json["weapon_type"],
        ascensionMaterials:
            AscensionMaterials.fromJson(json["ascension_materials"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "vision": vision,
        "weapon": weapon,
        "gender": gender,
        "nation": nation,
        "affiliation": affiliation,
        "rarity": rarity,
        "release":
            "${release.year.toString().padLeft(4, '0')}-${release.month.toString().padLeft(2, '0')}-${release.day.toString().padLeft(2, '0')}",
        "constellation": constellation,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "description": description,
        "skillTalents": List<dynamic>.from(skillTalents.map((x) => x.toJson())),
        "passiveTalents":
            List<dynamic>.from(passiveTalents.map((x) => x.toJson())),
        "constellations":
            List<dynamic>.from(constellations.map((x) => x.toJson())),
        "vision_key": visionKey,
        "weapon_type": weaponType,
        "ascension_materials": ascensionMaterials.toJson(),
        "id": id,
      };
}
