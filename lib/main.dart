import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_2/core/routes/app_routes.dart';
import 'package:pokedex_2/app/pages/pokemon_list_page.dart' as ListPage;
import 'package:pokedex_2/core/controllers/pokemon_controller.dart';

void main() {
  Get.put(
      PokemonController()); // Inyecta el controlador PokemonController utilizando GetX.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex 2',
      initialRoute: '/pokedex', // Ruta inicial de la aplicación.
      getPages:
          AppRoutes.pages, // Define las rutas de la aplicación usando GetX.

      onGenerateRoute: (settings) {
        if (settings.name == '/pokedex') {
          // Si la ruta solicitada es '/pokedex', muestra la página de lista de Pokémon.
          return GetPageRoute(
            page: () => ListPage.PokemonListPage(),
          );
        }
        return null; // Devuelve nulo si la ruta no coincide con ninguna ruta definida.
      },
    );
  }
}
