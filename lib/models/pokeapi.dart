import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class PokeAPI {
  static const baseUrl = 'https://pokeapi.co/api/v2';

  static Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=100'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      final pokemonList = <Pokemon>[];
      for (final result in results) {
        final pokemonResponse = await http.get(Uri.parse(result['url']));
        if (pokemonResponse.statusCode == 200) {
          final pokemonData = jsonDecode(pokemonResponse.body);
          final types = (pokemonData['types'] as List<dynamic>)
              .map((typeData) => typeData['type']['name'] as String)
              .toList();
          final weight = (pokemonData['weight'] as int).toDouble() / 10;
          final pokemon = Pokemon(
            name: result['name'],
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${result['url'].split('/')[6]}.png',
            types: types,
            weight: weight,
          );
          pokemonList.add(pokemon);
        } else {
          throw Exception('Failed to load Pokémon: ${result['name']}');
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }
}
