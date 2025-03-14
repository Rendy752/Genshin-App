import 'dart:convert';

import 'package:genshin_app/models/level.dart';

class AscensionMaterials {
  List<Level> level20;
  List<Level> level40;
  List<Level> level50;
  List<Level> level60;
  List<Level> level70;
  List<Level> level80;

  AscensionMaterials({
    required this.level20,
    required this.level40,
    required this.level50,
    required this.level60,
    required this.level70,
    required this.level80,
  });

  factory AscensionMaterials.fromRawJson(String str) =>
      AscensionMaterials.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AscensionMaterials.fromJson(Map<String, dynamic> json) =>
      AscensionMaterials(
        level20:
            List<Level>.from(json["level_20"].map((x) => Level.fromJson(x))),
        level40:
            List<Level>.from(json["level_40"].map((x) => Level.fromJson(x))),
        level50:
            List<Level>.from(json["level_50"].map((x) => Level.fromJson(x))),
        level60:
            List<Level>.from(json["level_60"].map((x) => Level.fromJson(x))),
        level70:
            List<Level>.from(json["level_70"].map((x) => Level.fromJson(x))),
        level80:
            List<Level>.from(json["level_80"].map((x) => Level.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "level_20": List<dynamic>.from(level20.map((x) => x.toJson())),
        "level_40": List<dynamic>.from(level40.map((x) => x.toJson())),
        "level_50": List<dynamic>.from(level50.map((x) => x.toJson())),
        "level_60": List<dynamic>.from(level60.map((x) => x.toJson())),
        "level_70": List<dynamic>.from(level70.map((x) => x.toJson())),
        "level_80": List<dynamic>.from(level80.map((x) => x.toJson())),
      };
}
