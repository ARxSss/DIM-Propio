import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/item_model.dart';
import '../models/character_model.dart';

class InventoryProvider extends ChangeNotifier {
  static const String _pcIp = '127.0.0.1'; 
  static const String _apiBase = 'http://$_pcIp/destiny_api';

  List<DestinyItem> _items = [];
  List<DestinyCharacter> _characters = [];
  String _selectedCharacterId = '';
  bool _isLoading = false;

  List<DestinyItem> get items => _items;
  List<DestinyCharacter> get characters => _characters;
  String get selectedCharacterId => _selectedCharacterId;
  bool get isLoading => _isLoading;

  Future<void> loadCharacters() async {
    try {
      final response = await http.get(Uri.parse('$_apiBase/get_characters.php'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _characters = data.map((json) => DestinyCharacter.fromJson(json)).toList();
        
        if (_characters.isNotEmpty && _selectedCharacterId.isEmpty) {
          selectCharacter(_characters.first.id);
        } else {
          notifyListeners();
        }
      }
    } catch (e) {
      print("Error cargando personajes: $e");
    }
  }

  void selectCharacter(String characterId) {
    _selectedCharacterId = characterId;
    notifyListeners();
    _loadInventory();
  }

  Future<void> _loadInventory() async {
    if (_selectedCharacterId.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      final url = '$_apiBase/get_inventory.php?characterId=$_selectedCharacterId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _items = data.map((json) => DestinyItem(
          instanceId: int.tryParse(json['id_instancia'].toString()) ?? 0,
          itemHash: int.tryParse(json['id_def_item'].toString()) ?? 0,
          name: json['nombre'] ?? 'Desconocido',
          iconPath: json['ruta_captura_pantalla'] ?? '',
          powerLevel: int.tryParse(json['nivel_poder_actual'].toString()) ?? 0,
          rarity: (json['id_rareza'] == '4') ? 'Exotic' : 'Legendary',
          slotName: json['nombre_slot'] ?? 'General',
        )).toList();
      }
    } catch (e) {
      print("Error cargando inventario: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}