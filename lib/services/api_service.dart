import 'dart:convert';

import 'package:genshin_app/models/character.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://genshin.jmp.blue';

  Future<List<String>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<String> characters = body.cast<String>();
      return characters;
    } else {
      throw Exception('Failed to load all characters');
    }
  }

  Future<Character> fetchCharacterDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/characters/$id'));

    if (response.statusCode == 200) {
      Character character = characterFromJson(response.body);
      print('character: ${character}');
      return character;
    } else {
      throw Exception('Failed to load character detail');
    }
  }
}
