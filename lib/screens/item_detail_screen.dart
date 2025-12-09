import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class ItemDetailScreen extends StatefulWidget {
  final DestinyItem item;
  const ItemDetailScreen({super.key, required this.item});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  final String _phpUrl = "http://192.168.1.105/destiny_api/get_item_details.php";

  Map<String, dynamic> info = {};
  List<dynamic> stats = [];
  List<dynamic> perks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  Future<void> _fetchDetails() async {
    try {
      final url = Uri.parse("$_phpUrl?instanceId=${widget.item.instanceId}");
      print("Consultando: $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          info = data['info'] ?? {};
          stats = data['stats'] ?? [];
          perks = data['perks'] ?? [];
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching details: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isExotic = widget.item.rarity == 'Exotic';
    final Color mainColor = isExotic ? const Color(0xFFF5DC56) : const Color(0xFF522F65);
    final Color bgColor = const Color(0xFF181C25);

    return Scaffold(
      backgroundColor: bgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [mainColor.withOpacity(0.6), bgColor],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "item_${widget.item.instanceId}",
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor, width: 2),
                            boxShadow: [BoxShadow(color: mainColor.withOpacity(0.4), blurRadius: 20)],
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.item.fullIconUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.slotName.toUpperCase(),
                              style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              widget.item.name,
                              style: const TextStyle(
                                fontSize: 26, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.white, 
                                height: 1.1
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8CA4E),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "⚡ ${widget.item.powerLevel}",
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (info['descripcion'] != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\"${info['descripcion']}\"",
                  style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.white70, fontSize: 15),
                ),
              ),

            const SizedBox(height: 25),
            const Divider(color: Colors.white10, thickness: 1),

            if (perks.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("TALENTOS DE ARMA", style: TextStyle(color: Colors.grey, letterSpacing: 1.2, fontWeight: FontWeight.bold)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: perks.map((perk) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Tooltip(
                        message: "${perk['nombre']}\n\n${perk['descripcion'] ?? ''}",
                        triggerMode: TooltipTriggerMode.tap, 
                        showDuration: const Duration(seconds: 4),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(color: const Color(0xFF2D3342), borderRadius: BorderRadius.circular(8)),
                        textStyle: const TextStyle(color: Colors.white),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black45,
                                border: Border.all(
                                  color: perk['esta_activo'] == '1' ? mainColor : Colors.white24, 
                                  width: 2
                                ),
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: "https://www.bungie.net${perk['ruta_icono']}",
                                  placeholder: (c, u) => const Icon(Icons.circle, color: Colors.grey),
                                  errorWidget: (c, u, e) => const Icon(Icons.help, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white10, thickness: 1),
            ],

            if (stats.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("ESTADÍSTICAS", style: TextStyle(color: Colors.grey, letterSpacing: 1.2, fontWeight: FontWeight.bold)),
              ),
              ...stats.map((stat) {
                int val = int.tryParse(stat['valor'].toString()) ?? 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100, 
                        child: Text(stat['nombre'], style: const TextStyle(color: Colors.white70), textAlign: TextAlign.end)
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(5)),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: (val / 100).clamp(0.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 30, 
                        child: Text("$val", style: const TextStyle(color: Color(0xFFE8CA4E), fontWeight: FontWeight.bold))
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],

            if (info['texto_lore'] != null && info['texto_lore'].toString().isNotEmpty) ...[
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  border: Border(left: BorderSide(color: mainColor, width: 3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Icon(Icons.auto_stories, color: mainColor, size: 16),
                      const SizedBox(width: 8),
                      const Text("HISTORIA", style: TextStyle(color: Colors.grey, letterSpacing: 2, fontSize: 12)),
                    ]),
                    const SizedBox(height: 10),
                    Text(
                      info['texto_lore'],
                      style: const TextStyle(color: Colors.white70, height: 1.6, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}