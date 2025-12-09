import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/inventory_provider.dart';
import 'screens/inventory_screen.dart';

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
      
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF181C25),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const InventoryScreen(), 
    );
  }
}