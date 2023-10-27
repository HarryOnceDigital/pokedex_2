class Pokemon {
  final int id; // El ID del Pokémon.
  final String name; // El nombre del Pokémon.
  final String imageUrl; // La URL de la imagen del Pokémon.

  Pokemon({
    required this.id, // Constructor que requiere el ID.
    required this.name, // Constructor que requiere el nombre.
    required this.imageUrl, // Constructor que requiere la URL de la imagen.
  });

  // Constructor de fábrica para crear una instancia de Pokemon a partir de un mapa de datos.
  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'], // Asigna el valor 'id' del mapa al campo 'id' del Pokemon.
      name: map[
          'name'], // Asigna el valor 'name' del mapa al campo 'name' del Pokemon.
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${map['id']}.png', // Crea la URL de la imagen utilizando el ID del Pokémon.
    );
  }
}
