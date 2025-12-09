import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/item_model.dart';

class SubclassTile extends StatelessWidget {
  final DestinyItem item;
  final VoidCallback? onTap;

  const SubclassTile({super.key, required this.item, this.onTap});

  Color _getElementColor(int energyId) {
    switch (energyId) {
      case 1: return const Color(0xFFF0631E);
      case 2: return const Color(0xFF7ACCEC);
      case 3: return const Color(0xFFB185DF);
      case 4: return const Color(0xFF4D88FF);
      case 5: return const Color(0xFF35E397);
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    Color color = Colors.grey;
    final name = item.name.toLowerCase();
    if (name.contains('solar') || name.contains('pistolero')) color = const Color(0xFFF0631E);
    else if (name.contains('arco') || name.contains('jinete')) color = const Color(0xFF7ACCEC);
    else if (name.contains('vacío') || name.contains('acechador')) color = const Color(0xFFB185DF);
    else if (name.contains('estasis') || name.contains('behemoth')) color = const Color(0xFF4D88FF);
    else if (name.contains('cuerdas') || name.contains('hilador')) color = const Color(0xFF35E397);

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: 0.785398,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  border: Border.all(color: color, width: 2),
                ),
              ),
            ),
            
            SizedBox(
              width: 40,
              height: 40,
              child: item.fullIconUrl.contains('http') 
                  ? CachedNetworkImage(
                      imageUrl: item.fullIconUrl,
                      color: Colors.white,
                      fit: BoxFit.contain,
                    )
                  : Icon(Icons.flash_on, color: color),
            ),
          ],
        ),
      ),
    );
  }
}