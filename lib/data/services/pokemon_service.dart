import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonService {
  final String baseUrl = 'https://pokeapi.co/api/v2';

  // Método para obtener la lista de Pokémon desde la API.
  Future<Map<String, dynamic>> fetchPokemonList() async {
    final response =
        await http.get(Uri.parse('$baseUrl/pokemon?offset=0&limit=20'));
    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, decodifica los datos JSON y devuelve un mapa.
      return json.decode(response.body);
    } else {
      // Si la respuesta no es exitosa, lanza una excepción con un mensaje de error.
      throw Exception('Error al cargar la lista de Pokémon');
    }
  }

  // Método para obtener los detalles de un Pokémon por su ID desde la API.
  Future<Map<String, dynamic>> fetchPokemonDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));
    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, decodifica los datos JSON y devuelve un mapa.
      return json.decode(response.body);
    } else {
      // Si la respuesta no es exitosa, lanza una excepción con un mensaje de error.
      throw Exception('Error al cargar los detalles del Pokémon');
    }
  }
}
