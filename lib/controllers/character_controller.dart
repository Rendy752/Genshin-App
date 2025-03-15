import 'package:genshin_app/models/character.dart';
import 'package:genshin_app/services/api_service.dart';
import 'package:get/get.dart';

class CharacterController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = true.obs;

  var characterList = <String>[].obs;
  var filteredCharacters = <String>[].obs;

  var selectedCharacter = Rxn<Character>();

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
      filteredCharacters.assignAll(characters);
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

  void searchCharacters(String keyword) {
    List<String> tempFilteredList = characterList.where((character) {
      return character.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    filteredCharacters.assignAll(tempFilteredList);
  }
}
