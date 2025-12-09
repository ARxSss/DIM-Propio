import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/inventory_provider.dart';
import 'inventory_screen.dart';

class CharacterSelectScreen extends StatelessWidget {
  const CharacterSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conexión Local"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey.withOpacity(0.2),
                  border: Border.all(color: Colors.blueGrey, width: 2),
                ),
                child: const Icon(
                  Icons.dns_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 30),

              const Text(
                "Servidor MySQL (XAMPP)",
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Asegúrate de que tu PC y este celular\nestén en la misma red Wi-Fi.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8CA4E),
                    foregroundColor: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.download_rounded),
                  label: const Text(
                    "CARGAR DESDE MI PC",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Conectando con XAMPP..."),
                        duration: Duration(milliseconds: 800),
                      ),
                    );

                    try {
                      await Provider.of<InventoryProvider>(context, listen: false)
                          .loadInventoryFromXampp();

                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const InventoryScreen(membershipId: 'LOCAL_MYSQL'),
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error: No se pudo conectar a la PC.\n$e"),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
              
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Si falla, verifica la IP en 'xampp_service.dart' y el firewall de Windows.",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}