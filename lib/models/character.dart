import 'dart:convert';

import 'package:genshin_app/models/ascension_materials.dart';
import 'package:genshin_app/models/constellation.dart';
import 'package:genshin_app/models/enum.dart';
import 'package:genshin_app/models/skill_talent.dart';
import 'package:genshin_app/outfit.dart';

class Character {
  String name;
  String? title;
  Vision vision;
  Weapon weapon;
  Gender? gender;
  Nation nation;
  String affiliation;
  int rarity;
  DateTime release;
  String constellation;
  String birthday;
  String description;
  List<SkillTalent> skillTalents;
  List<Constellation> passiveTalents;
  List<Constellation> constellations;
  VisionKey visionKey;
  WeaponType weaponType;
  AscensionMaterials ascensionMaterials;
  String id;
  String? specialDish;
  List<Outfit>? outfits;
  String? nameKey;

  Character({
    required this.name,
    this.title,
    required this.vision,
    required this.weapon,
    this.gender,
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
    this.specialDish,
    this.outfits,
    this.nameKey,
  });

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        title: json["title"],
        vision: visionValues.map[json["vision"]]!,
        weapon: weaponValues.map[json["weapon"]]!,
        gender: genderValues.map[json["gender"]]!,
        nation: nationValues.map[json["nation"]]!,
        affiliation: json["affiliation"],
        rarity: json["rarity"],
        release: DateTime.parse(json["release"]),
        constellation: json["constellation"],
        birthday: json["birthday"],
        description: json["description"],
        skillTalents: List<SkillTalent>.from(
            json["skillTalents"].map((x) => SkillTalent.fromJson(x))),
        passiveTalents: List<Constellation>.from(
            json["passiveTalents"].map((x) => Constellation.fromJson(x))),
        constellations: List<Constellation>.from(
            json["constellations"].map((x) => Constellation.fromJson(x))),
        visionKey: visionKeyValues.map[json["vision_key"]]!,
        weaponType: weaponTypeValues.map[json["weapon_type"]]!,
        ascensionMaterials:
            AscensionMaterials.fromJson(json["ascension_materials"]),
        id: json["id"],
        specialDish: json["specialDish"],
        outfits: json["outfits"] == null
            ? []
            : List<Outfit>.from(
                json["outfits"]!.map((x) => Outfit.fromJson(x))),
        nameKey: json["name_key"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "vision": visionValues.reverse[vision],
        "weapon": weaponValues.reverse[weapon],
        "gender": genderValues.reverse[gender],
        "nation": nationValues.reverse[nation],
        "affiliation": affiliation,
        "rarity": rarity,
        "release":
            "${release.year.toString().padLeft(4, '0')}-${release.month.toString().padLeft(2, '0')}-${release.day.toString().padLeft(2, '0')}",
        "constellation": constellation,
        "birthday": birthday,
        "description": description,
        "skillTalents": List<dynamic>.from(skillTalents.map((x) => x.toJson())),
        "passiveTalents":
            List<dynamic>.from(passiveTalents.map((x) => x.toJson())),
        "constellations":
            List<dynamic>.from(constellations.map((x) => x.toJson())),
        "vision_key": visionKeyValues.reverse[visionKey],
        "weapon_type": weaponTypeValues.reverse[weaponType],
        "ascension_materials": ascensionMaterials.toJson(),
        "id": id,
        "specialDish": specialDish,
        "outfits": outfits == null
            ? []
            : List<dynamic>.from(outfits!.map((x) => x.toJson())),
        "name_key": nameKey,
      };
}
