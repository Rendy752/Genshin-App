import 'package:flutter/material.dart';
import 'package:genshin_app/controllers/character_controller.dart';
import 'package:genshin_app/services/api_service.dart';
import 'package:genshin_app/views/character_detail_view.dart';
import 'package:get/get.dart';

class CharacterListView extends StatelessWidget {
  CharacterListView({super.key});

  final CharacterController characterController =
      Get.put(CharacterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: Obx(() {
        if (characterController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (characterController.characterList.isEmpty) {
          return const Center(child: Text('No characters found'));
        } else {
          return ListView.builder(
              itemCount: characterController.characterList.length,
              itemBuilder: (context, index) {
                final characterName = characterController.characterList[index];
                return ListTile(
                  leading: Image.network(
                      '${ApiService.baseUrl}/characters/$characterName/card'),
                  title: Text(characterName),
                  onTap: () {
                    var snackbar = SnackBar(
                        content: Text("character clicked: $characterName"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    characterController.fetchCharacterDetail(characterName);
                    Get.to(() =>
                        CharacterDetailView(characterName: characterName));
                  },
                );
              });
        }
      }),
    );
  }
}
