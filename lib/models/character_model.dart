class DestinyCharacter {
  final String id;
  final String className;
  final int lightLevel;
  final String emblemPath;

  DestinyCharacter({
    required this.id,
    required this.className,
    required this.lightLevel,
    required this.emblemPath,
  });

  factory DestinyCharacter.fromJson(Map<String, dynamic> json) {
    return DestinyCharacter(
      id: json['id_personaje'].toString(),
      className: json['nombre_clase'] ?? 'Desconocido',
      lightLevel: int.tryParse(json['nivel_luz'].toString()) ?? 0,
      emblemPath: json['ruta_emblema'] ?? '',
    );
  }
}