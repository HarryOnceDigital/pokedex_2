import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_2/core/controllers/pokemon_controller.dart';
import 'package:pokedex_2/data/models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonController controller =
      Get.find(); // Obtiene una instancia de PokemonController.

  @override
  Widget build(BuildContext context) {
    final int pokemonId = int.parse(Get.parameters['id'] ??
        '1'); // Obtiene el ID del Pokémon desde los parámetros de la ruta.
    final pokemon = controller.pokemonList.firstWhere(
      (p) => p.id == pokemonId, // Busca el Pokémon con el ID correspondiente.
      orElse: () => Pokemon(
          id: 0,
          name: 'Unknown',
          imageUrl: ''), // Si no se encuentra, muestra valores predeterminados.
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon
            .name), // Muestra el nombre del Pokémon en la barra de navegación.
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: Get.height / 2, // Altura igual al ancho de la pantalla
            width: Get.width, // Ancho igual al ancho de la pantalla
            color: Colors.red, // Color de fondo rojo
            child: Image.network(
              pokemon.imageUrl,
              fit:
                  BoxFit.cover, // Ajusta la imagen para que cubra el contenedor
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Número: #${pokemon.id}'), // Muestra el número del Pokémon.
                // Puedes agregar más detalles del Pokémon según tus necesidades.
              ],
            ),
          ),
        ],
      ),
    );
  }
}
