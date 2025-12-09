import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class XamppService {

  static const String _pcIp = '127.0.0.1'; 
  
  static const String _baseUrl = 'http://$_pcIp:8080/destiny_api/get_inventory.php';

  Future<List<DestinyItem>> getLocalInventory() async {
    try {
      print("🔌 Conectando a XAMPP en: $_baseUrl");
      
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print("📦 Datos recibidos: ${data.length} items");

        return data.map((json) => DestinyItem(
          instanceId: int.tryParse(json['instanceId'].toString()) ?? 0,
          itemHash: int.tryParse(json['itemHash'].toString()) ?? 0,
          name: json['name'] ?? 'Desconocido',
          iconPath: json['iconPath'], 
          powerLevel: int.tryParse(json['powerLevel'].toString()) ?? 0,
          rarity: json['rarity'] ?? 'Common',
          slotName: "Inventario",
        )).toList();
      } else {
        throw Exception('Error servidor: ${response.statusCode}');
      }
    } catch (e) {
      print("❌ Error XAMPP: $e");
      rethrow;
    }
  }
}