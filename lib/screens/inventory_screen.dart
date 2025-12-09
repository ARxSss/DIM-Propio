import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/inventory_provider.dart';
import 'item_detail_screen.dart';

class InventoryScreen extends StatefulWidget {
  final String membershipId;
  
  const InventoryScreen({super.key, this.membershipId = 'LOCAL'});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InventoryProvider>(context, listen: false)
          .loadInventoryFromXampp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InventoryProvider>(context);

    const Color colorExotic = Color(0xFFF5DC56);
    const Color colorLegendary = Color(0xFF522F65);
    const Color colorBackground = Color(0xFF181C25);

    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        title: const Text("Inventario"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Recargar XAMPP",
            onPressed: () {
              provider.loadInventoryFromXampp();
            },
          )
        ],
      ),
      body: provider.isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: colorExotic),
                  SizedBox(height: 20),
                  Text("Conectando con tu PC...", style: TextStyle(color: Colors.white70)),
                ],
              ),
            )
          : provider.items.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.signal_wifi_off, size: 60, color: Colors.redAccent),
                        const SizedBox(height: 20),
                        const Text(
                          "¡No llegaron datos!",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: const Text(
                            "Posibles causas:\n"
                            "1. La IP en 'xampp_service.dart' es incorrecta.\n"
                            "2. El Firewall de Windows bloqueó Apache.\n"
                            "3. Tu base de datos MySQL está vacía.\n"
                            "4. No estás en la misma red Wi-Fi.",
                            style: TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorExotic,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          ),
                          icon: const Icon(Icons.refresh),
                          label: const Text("REINTENTAR"),
                          onPressed: () {
                            provider.loadInventoryFromXampp();
                          },
                        )
                      ],
                    ),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) {
                    final item = provider.items[index];
                    final bool isExotic = item.rarity == 'Exotic';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ItemDetailScreen(item: item),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: isExotic ? colorExotic : colorLegendary,
                            width: isExotic ? 2.5 : 1.5,
                          ),
                          boxShadow: isExotic
                              ? [BoxShadow(color: colorExotic.withOpacity(0.4), blurRadius: 4)]
                              : [],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: item.fullIconUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(color: Colors.grey[900]),
                              errorWidget: (context, url, error) => const Icon(Icons.broken_image, color: Colors.white24),
                            ),
                            
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black87,
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                child: Text(
                                  "${item.powerLevel}",
                                  style: const TextStyle(
                                    color: colorExotic, 
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}