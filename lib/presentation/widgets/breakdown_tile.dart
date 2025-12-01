import 'package:flutter/material.dart';
import '../../domain/models/hero_model.dart';
import '../../domain/models/score_breakdown.dart';

class BreakdownTile extends StatelessWidget {
  final HeroModel hero;
  final ScoreBreakdown breakdown;

  const BreakdownTile({
    super.key,
    required this.hero,
    required this.breakdown,
  });

  @override
  Widget build(BuildContext context) {
    final s = breakdown.strongCount;
    final w = breakdown.weakCount;
    final y = breakdown.synergyCount;
    final total = breakdown.total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hero.name.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "+$s  -$w  +$y  = $total",
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
