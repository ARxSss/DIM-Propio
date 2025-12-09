import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'providers/inventory_provider.dart';
import 'screens/character_select_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventoryProvider()),
      ],
      child: const DestinyInventoryApp(),
    ),
  );
}

class DestinyInventoryApp extends StatelessWidget {
  const DestinyInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guardian Manager',
      theme: AppTheme.darkTheme,
      home: const CharacterSelectScreen(),
    );
  }
}

