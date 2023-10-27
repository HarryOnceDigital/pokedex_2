import 'package:get/get.dart';
import 'package:pokedex_2/app/pages/pokemon_detail_page.dart' as DetailPage;
import 'package:pokedex_2/app/pages/pokemon_list_page.dart';

class AppRoutes {
  // Lista de páginas definidas para la navegación en la aplicación.
  static final List<GetPage> pages = [
    GetPage(
      name: '/pokedex', // Nombre de la ruta para la lista de Pokémon.
      page: () => PokemonListPage(), // Widget de la página de lista de Pokémon.
    ),
    GetPage(
      name:
          '/pokemon/:id', // Nombre de la ruta para la página de detalles del Pokémon.
      page: () => DetailPage
          .PokemonDetailPage(), // Widget de la página de detalles del Pokémon.
    ),
  ];
}
