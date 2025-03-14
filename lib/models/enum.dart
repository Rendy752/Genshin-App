class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

enum ConstellationUnlock {
  CONSTELLATION_LV_1,
  CONSTELLATION_LV_2,
  CONSTELLATION_LV_3,
  CONSTELLATION_LV_4,
  CONSTELLATION_LV_5,
  CONSTELLATION_LV_6,
  NIGHT_REALM_S_GIFT_PASSIVE,
  UNLOCKED_AT_ASCENSION_1,
  UNLOCKED_AT_ASCENSION_4,
  UNLOCKED_AUTOMATICALLY
}

final constellationUnlockValues = EnumValues({
  "Constellation Lv. 1": ConstellationUnlock.CONSTELLATION_LV_1,
  "Constellation Lv. 2": ConstellationUnlock.CONSTELLATION_LV_2,
  "Constellation Lv. 3": ConstellationUnlock.CONSTELLATION_LV_3,
  "Constellation Lv. 4": ConstellationUnlock.CONSTELLATION_LV_4,
  "Constellation Lv. 5": ConstellationUnlock.CONSTELLATION_LV_5,
  "Constellation Lv. 6": ConstellationUnlock.CONSTELLATION_LV_6,
  "Night Realm's Gift Passive": ConstellationUnlock.NIGHT_REALM_S_GIFT_PASSIVE,
  "Unlocked at Ascension 1": ConstellationUnlock.UNLOCKED_AT_ASCENSION_1,
  "Unlocked at Ascension 4": ConstellationUnlock.UNLOCKED_AT_ASCENSION_4,
  "Unlocked Automatically": ConstellationUnlock.UNLOCKED_AUTOMATICALLY
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

enum Nation {
  FONTAINE,
  INAZUMA,
  LIYUE,
  MONDSTADT,
  NATLAN,
  OUTLANDER,
  SNEZHNAYA,
  SUMERU,
  UNKNOWN
}

final nationValues = EnumValues({
  "Fontaine": Nation.FONTAINE,
  "Inazuma": Nation.INAZUMA,
  "Liyue": Nation.LIYUE,
  "Mondstadt": Nation.MONDSTADT,
  "Natlan": Nation.NATLAN,
  "Outlander": Nation.OUTLANDER,
  "Snezhnaya": Nation.SNEZHNAYA,
  "Sumeru": Nation.SUMERU,
  "Unknown": Nation.UNKNOWN
});

enum Type { ELEMENTAL_BURST, ELEMENTAL_SKILL, NORMAL_ATTACK }

final typeValues = EnumValues({
  "ELEMENTAL_BURST": Type.ELEMENTAL_BURST,
  "ELEMENTAL_SKILL": Type.ELEMENTAL_SKILL,
  "NORMAL_ATTACK": Type.NORMAL_ATTACK
});

enum SkillTalentUnlock {
  ELEMENTAL_BURST,
  ELEMENTAL_SKILL,
  NORMAL_ATTACK,
  RIGHT_CLICK,
  UNLOCK_ELEMENTAL_BURST,
  UNLOCK_ELEMENTAL_SKILL,
  UNLOCK_NORMAL_ATTACK
}

final skillTalentUnlockValues = EnumValues({
  "Elemental Burst": SkillTalentUnlock.ELEMENTAL_BURST,
  "Elemental Skill": SkillTalentUnlock.ELEMENTAL_SKILL,
  "Normal Attack": SkillTalentUnlock.NORMAL_ATTACK,
  "Right Click": SkillTalentUnlock.RIGHT_CLICK,
  "Elemental burst": SkillTalentUnlock.UNLOCK_ELEMENTAL_BURST,
  "Elemental skill": SkillTalentUnlock.UNLOCK_ELEMENTAL_SKILL,
  "Normal attack": SkillTalentUnlock.UNLOCK_NORMAL_ATTACK
});

enum Vision { ANEMO, CRYO, DENDRO, ELECTRO, GEO, HYDRO, PYRO }

final visionValues = EnumValues({
  "Anemo": Vision.ANEMO,
  "Cryo": Vision.CRYO,
  "Dendro": Vision.DENDRO,
  "Electro": Vision.ELECTRO,
  "Geo": Vision.GEO,
  "Hydro": Vision.HYDRO,
  "Pyro": Vision.PYRO
});

enum VisionKey { ANEMO, CRYO, DENDRO, ELECTRO, GEO, HYDRO, PYRO }

final visionKeyValues = EnumValues({
  "ANEMO": VisionKey.ANEMO,
  "CRYO": VisionKey.CRYO,
  "DENDRO": VisionKey.DENDRO,
  "ELECTRO": VisionKey.ELECTRO,
  "GEO": VisionKey.GEO,
  "HYDRO": VisionKey.HYDRO,
  "PYRO": VisionKey.PYRO
});

enum Weapon { BOW, CATALYST, CLAYMORE, POLEARM, SWORD }

final weaponValues = EnumValues({
  "Bow": Weapon.BOW,
  "Catalyst": Weapon.CATALYST,
  "Claymore": Weapon.CLAYMORE,
  "Polearm": Weapon.POLEARM,
  "Sword": Weapon.SWORD
});

enum WeaponType { BOW, CATALYST, CLAYMORE, POLEARM, SWORD }

final weaponTypeValues = EnumValues({
  "BOW": WeaponType.BOW,
  "CATALYST": WeaponType.CATALYST,
  "CLAYMORE": WeaponType.CLAYMORE,
  "POLEARM": WeaponType.POLEARM,
  "SWORD": WeaponType.SWORD
});
