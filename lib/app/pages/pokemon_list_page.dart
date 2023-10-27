import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_2/core/controllers/pokemon_controller.dart';

class PokemonListPage extends StatelessWidget {
  final PokemonController controller =
      Get.find(); // Obtiene una instancia de PokemonController.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Barra de navegación con título.
        title: Text('Pokedex 2'),
        backgroundColor: Colors.red,
      ),
      body: Obx(
        () {
          if (controller.pokemonList.isEmpty) {
            return Center(
                child:
                    CircularProgressIndicator()); // Muestra un indicador de carga si la lista está vacía.
          }

          return ListView.builder(
            itemCount: controller.pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = controller.pokemonList[index];
              return ListTile(
                leading: Image.network(
                    pokemon.imageUrl), // Muestra la imagen del Pokémon.
                title: Text(pokemon.name), // Muestra el nombre del Pokémon.
                subtitle: Text('#${pokemon.id}'), // Muestra el ID del Pokémon.
                onTap: () {
                  Get.toNamed(
                      '/pokemon/${pokemon.id}'); // Navega a la página de detalles del Pokémon al hacer clic.
                },
              );
            },
          );
        },
      ),
    );
  }
}
