import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/inventory_provider.dart';
import '../models/item_model.dart';
import 'item_detail_screen.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<String> _sectionOrder = [
    'Subclase',
    'Cinética',
    'Energética',
    'Destructiva',
    'Casco',
    'Guanteletes',
    'Pecho',
    'Piernas',
    'Objeto de Clase',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InventoryProvider>(context, listen: false).loadCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InventoryProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF181C25),
      appBar: AppBar(
        title: const Text("Guardian Manager"),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => provider.loadCharacters(),
          )
        ],
      ),
      body: Column(
        children: [
          if (provider.characters.isNotEmpty)
            Container(
              height: 85,
              width: double.infinity,
              color: Colors.black54,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                itemCount: provider.characters.length,
                itemBuilder: (context, index) {
                  final char = provider.characters[index];
                  final isSelected = char.id == provider.selectedCharacterId;

                  Color classColor = Colors.grey;
                  if (char.className == 'Titán') classColor = Colors.redAccent;
                  if (char.className == 'Cazador') classColor = Colors.blueAccent;
                  if (char.className == 'Hechicero') classColor = Colors.amber;

                  return GestureDetector(
                    onTap: () => provider.selectCharacter(char.id),
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? classColor.withOpacity(0.2) : Colors.transparent,
                        border: Border.all(
                          color: isSelected ? classColor : Colors.white10,
                          width: isSelected ? 2 : 1
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            char.className.toUpperCase(),
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "⚡ ${char.lightLevel}",
                            style: const TextStyle(color: Color(0xFFE8CA4E), fontWeight: FontWeight.w900, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          Expanded(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator(color: Color(0xFFE8CA4E)))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 50),
                    itemCount: _sectionOrder.length,
                    itemBuilder: (context, index) {
                      final sectionName = _sectionOrder[index];
                      final sectionItems = provider.items
                          .where((item) => item.slotName == sectionName)
                          .toList();

                      if (sectionItems.isEmpty) return const SizedBox.shrink();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            color: Colors.white.withOpacity(0.05),
                            child: Text(
                              sectionName.toUpperCase(),
                              style: const TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                childAspectRatio: 1.0,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                              ),
                              itemCount: sectionItems.length,
                              itemBuilder: (context, itemIndex) {
                                final item = sectionItems[itemIndex];
                                
                                if (sectionName == 'Subclase') {
                                  return _buildSubclassTile(item);
                                }
                                return _buildItemTile(item);
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemTile(DestinyItem item) {
    Color borderColor = item.rarity == 'Exotic' ? const Color(0xFFF5DC56) : const Color(0xFF522F65);
    
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ItemDetailScreen(item: item))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: borderColor, width: item.rarity == 'Exotic' ? 2 : 1),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: item.fullIconUrl,
              fit: BoxFit.cover,
              errorWidget: (c, u, e) => const Icon(Icons.broken_image, color: Colors.white24),
            ),
            Positioned(
              bottom: 0, right: 0,
              child: Container(
                color: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text("${item.powerLevel}", style: TextStyle(color: borderColor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSubclassTile(DestinyItem item) {
    Color color = Colors.grey;
    String name = item.name.toLowerCase();
    if (name.contains('solar') || name.contains('pistolero') || name.contains('amanecer') || name.contains('quiebrasoles')) color = Colors.orange;
    else if (name.contains('arco') || name.contains('jinete') || name.contains('tormenta') || name.contains('asaltante')) color = Colors.cyanAccent;
    else if (name.contains('vacío') || name.contains('acechador') || name.contains('caminante') || name.contains('centinela')) color = Colors.deepPurpleAccent;
    else if (name.contains('estasis') || name.contains('hielo') || name.contains('behemoth')) color = Colors.indigo;
    else if (name.contains('cuerdas') || name.contains('tejedor') || name.contains('hilador')) color = Colors.greenAccent;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ItemDetailScreen(item: item))),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: 0.785,
              child: Container(
                width: 50, height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  border: Border.all(color: color, width: 2),
                ),
              ),
            ),
            SizedBox(
              width: 35, height: 35,
              child: CachedNetworkImage(
                imageUrl: item.fullIconUrl,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}