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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      '${ApiService.baseUrl}/characters/$characterName/card',
                      width: 200,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
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
                ),
                const SizedBox(height: 20),
                _buildDetailRow('Title', character?.title),
                _buildDetailRow(
                    'Vision', visionValues.reverse[character?.vision]),
                _buildDetailRow(
                    'Weapon', weaponValues.reverse[character?.weapon]),
                _buildDetailRow('Rarity', character?.rarity.toString()),
                _buildDetailRow('Constellation', character?.constellation),
                const SizedBox(height: 10),
                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(character?.description ?? 'No description available'),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: '$label: ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value ?? 'N/A'),
          ],
        ),
      ),
    );
  }
}
