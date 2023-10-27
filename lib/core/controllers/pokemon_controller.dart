import 'package:get/get.dart';
import 'package:pokedex_2/data/models/pokemon.dart';
import 'package:pokedex_2/data/services/pokemon_service.dart';

class PokemonController extends GetxController {
  final RxList<Pokemon> pokemonList =
      <Pokemon>[].obs; // Lista observada de Pokémon.
  final Rx<Pokemon?> selectedPokemon = Rx(null); // Pokémon seleccionado.
  final PokemonService _pokemonService =
      PokemonService(); // Servicio para obtener datos de Pokémon.

  @override
  void onInit() {
    fetchPokemonList(); // Inicia la carga de la lista de Pokémon al inicializar el controlador.
    super.onInit();
  }

  // Método para obtener la lista de Pokémon desde el servicio.
  void fetchPokemonList() async {
    try {
      final data = await _pokemonService
          .fetchPokemonList(); // Obtiene datos de la lista de Pokémon.
      final results = data['results'];

      if (results != null && results is List) {
        final List<Pokemon> pokemonData = results
            .map((value) {
              if (value is Map) {
                final id = results.indexOf(value) +
                    1; // Calcula el ID del Pokémon como el índice + 1.
                final name = value['name'];
                final imageUrl =
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

                return Pokemon(id: id, name: name, imageUrl: imageUrl);
              }
              return null;
            })
            .where((pokemon) => pokemon != null) // Filtra los Pokémon no nulos.
            .cast<Pokemon>() // Convierte a una lista de Pokémon.
            .toList();

        pokemonList
            .assignAll(pokemonData); // Actualiza la lista de Pokémon observada.
      }
    } catch (error) {
      print(error); // Maneja errores mostrando un mensaje en la consola.
    }
  }

  // Método para seleccionar un Pokémon por su ID.
  Future<void> selectPokemon(int id) async {
    try {
      final pokemon = await _pokemonService
          .fetchPokemonDetails(id); // Obtiene detalles del Pokémon.
      selectedPokemon.value =
          pokemon as Pokemon?; // Actualiza el Pokémon seleccionado.
    } catch (error) {
      print(error); // Maneja errores mostrando un mensaje en la consola.
    }
  }
}
