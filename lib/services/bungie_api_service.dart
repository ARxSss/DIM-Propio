import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class BungieApiService {
  static const String _apiKey = 'f8a6aad5ce8447058df11a957d9a5d0a'; 
  static const String _baseUrl = 'https://www.bungie.net/Platform';
  
  final Map<String, String> _headers = {
    'X-API-Key': _apiKey,
  };

  Future<List<DestinyItem>> getProfileInventory(String membershipId, int membershipType) async {
    final url = Uri.parse(
        '$_baseUrl/Destiny2/$membershipType/Profile/$membershipId/?components=201,205');

    try {
      final response = await http.get(url, headers: _headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        if (data['ErrorCode'] != 1) {
          throw Exception('Error de Bungie: ${data['Message']}');
        }

        return _parseInventory(data['Response']);
      } else {
        throw Exception('Error HTTP: ${response.statusCode}');
      }
    } catch (e) {
      print("Error conectando a Bungie: $e");
      rethrow; 
    }
  }

  List<DestinyItem> _parseInventory(Map<String, dynamic> response) {
    List<DestinyItem> loadedItems = [];

    final characterEquipment = response['characterEquipment']['data'];
    
    if (characterEquipment != null) {
      characterEquipment.forEach((characterId, inventoryData) {
        final items = inventoryData['items'] as List;
        
        for (var itemJson in items) {
          loadedItems.add(DestinyItem(
            instanceId: int.tryParse(itemJson['itemInstanceId'] ?? '0') ?? 0,
            itemHash: itemJson['itemHash'],
            name: "Cargando...",
            iconPath: "",        
            powerLevel: 0,
            rarity: "Legendary", 
            slotName: "Equipped",
          ));
        }
      });
    }
    return loadedItems;
  }
}