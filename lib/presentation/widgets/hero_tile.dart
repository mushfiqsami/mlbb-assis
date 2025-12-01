import 'package:flutter/material.dart';
import '../../domain/models/hero_model.dart';

class HeroTile extends StatelessWidget {
  final HeroModel? hero;
  final VoidCallback onTap;

  const HeroTile({
    super.key,
    required this.hero,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isEmpty = hero == null;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.purple, width: 1.4),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.purple.shade100,
              backgroundImage:
                  isEmpty ? null : AssetImage(hero!.image),
              child: isEmpty
                  ? const Icon(Icons.help_outline, color: Colors.purple)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              isEmpty ? "Tap to pick hero" : hero!.name,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
