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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: characterController.characterList.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final characterName = characterController.characterList[index];
              return InkWell(
                onTap: () {
                  var snackbar = SnackBar(
                    content: Text("character clicked: $characterName"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  characterController.fetchCharacterDetail(characterName);
                  Get.to(
                      () => CharacterDetailView(characterName: characterName));
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          '${ApiService.baseUrl}/characters/$characterName/card',
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Center(child: Icon(Icons.error));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          characterName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
