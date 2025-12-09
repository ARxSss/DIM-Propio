import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('destiny_local.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre_bungie TEXT NOT NULL,
        plataforma_id INTEGER,
        ultimo_acceso TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE personajes (
        id_personaje INTEGER PRIMARY KEY,
        id_usuario INTEGER,
        id_clase INTEGER,
        nivel_luz INTEGER,
        ruta_emblema TEXT,
        fecha_creacion TEXT,
        ultimo_juego TEXT,
        FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
      )
    ''');
    
    await db.execute('''
      CREATE TABLE definiciones_items (
        id_def_item INTEGER PRIMARY KEY,
        nombre TEXT,
        ruta_icono TEXT,
        id_rareza INTEGER
      )
    ''');

    print("--- BASE DE DATOS CREADA Y VINCULADA EXITOSAMENTE ---");
  }

  Future<bool> testConnection() async {
    try {
      final db = await instance.database;
      int id = await db.insert('usuarios', {
        'nombre_bungie': 'Guardian_Test', 
        'plataforma_id': 3,
        'ultimo_acceso': DateTime.now().toIso8601String()
      });
      print("PRUEBA ÉXITOSA: Usuario insertado con ID: $id");
      
      final result = await db.query('usuarios');
      print("DATOS EN DB: $result");
      
      return true;
    } catch (e) {
      print("ERROR DE CONEXIÓN: $e");
      return false;
    }
  }
}