import 'package:flutter/material.dart';
import '../../domain/models/hero_model.dart';

class CounterIcons extends StatelessWidget {
  final HeroModel? hero;

  const CounterIcons({
    super.key,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    if (hero == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purpleAccent),
      ),
      child: Row(
        children: [
          const Icon(Icons.shield, size: 18, color: Colors.purpleAccent),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              "Counters for ${hero!.name}",
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
