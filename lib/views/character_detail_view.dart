import 'package:flutter/material.dart';
import 'package:genshin_app/controllers/character_controller.dart';
import 'package:genshin_app/models/enum.dart';
import 'package:genshin_app/services/api_service.dart';
import 'package:get/get.dart';

class CharacterDetailView extends StatelessWidget {
  final String characterName;
  CharacterDetailView({super.key, required this.characterName});

  final CharacterController characterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(characterName)),
        body: Obx(() {
          if (characterController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final character = characterController.selectedCharacter.value;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.network(
                    '${ApiService.baseUrl}/characters/$characterName/card',
                    width: 200,
                  )),
                  Text('Title : ${character?.title}'),
                  Text('Vision : ${visionValues.reverse[character?.vision]}'),
                  Text('Weapon : ${weaponValues.reverse[character?.weapon]}'),
                  Text('Rarity : ${character?.rarity}'),
                  Text('Constellation : ${character?.constellation}'),
                  Text('Description : ${character?.description}')
                ],
              ),
            );
          }
        }));
  }
}
