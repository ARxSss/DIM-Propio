import 'package:flutter/material.dart';
import '../services/xampp_service.dart';
import '../models/item_model.dart';

class InventoryProvider extends ChangeNotifier {
  final XamppService _xamppService = XamppService();
  
  List<DestinyItem> _items = [];
  bool _isLoading = false;
  
  List<DestinyItem> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> loadInventoryFromXampp() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await _xamppService.getLocalInventory();
      
    } catch (e) {
      print("Error cargando desde MySQL: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}