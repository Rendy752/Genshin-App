import 'package:genshin_app/models/character.dart';
import 'package:genshin_app/services/api_service.dart';
import 'package:get/get.dart';

class CharacterController extends GetxController {
  var isLoading = true.obs;
  var characterList = <String>[].obs;
  var selectedCharacter = Rxn<Character>();
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);
      var characters = await _apiService.fetchCharacters();
      characterList.assignAll(characters);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch characters: $e');
    } finally {
      isLoading(false);
    }
  }

  void fetchCharacterDetail(String id) async {
    try {
      isLoading(true);
      selectedCharacter.value = await _apiService.fetchCharacterDetail(id);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch characters: $e');
    } finally {
      isLoading(false);
    }
  }
}
