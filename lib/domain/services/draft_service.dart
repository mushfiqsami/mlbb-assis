import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/hero_model.dart';
import '../models/score_breakdown.dart';

class DraftService {
  late final Map<String, dynamic> _rawData;
  late final List<HeroModel> _allHeroes;

  // ----------------------------------------------------------
// LOAD ALL HEROES FROM JSON (once at startup)
// ----------------------------------------------------------
Future<List<HeroModel>> loadHeroes() async {
  final jsonString = await rootBundle.loadString("assets/data/heroes.json");
  _rawData = json.decode(jsonString);

  _allHeroes = _rawData.entries.map((entry) {
    final name = entry.key;
    final data = entry.value;

    return HeroModel(
      name: name,
      lane: data["lane"] ?? "",
      image: "assets/images/heroes/${name.toLowerCase()}.png",
      strongAgainst: List<String>.from(data["strong"] ?? []),
      weakAgainst: List<String>.from(data["weak"] ?? []),
      synergy: List<String>.from(data["synergy"] ?? []),
    );
  }).toList();

  return _allHeroes;
}




  // ----------------------------------------------------------
  // LOAD HEROES BY LANE
  // ----------------------------------------------------------
  Future<List<HeroModel>> loadHeroesByLane(String lane) async {
    return _allHeroes.where((h) => h.lane == lane).toList();
  }

  // ----------------------------------------------------------
  // COMPUTE STRONG/WEAK/SYNERGY FOR ONE HERO
  // ----------------------------------------------------------
  ScoreBreakdown computeScoreForHero(
      HeroModel hero, List<HeroModel?> enemyTeam) {

    final data = _rawData[hero.name];
    if (data == null) return const ScoreBreakdown(strongCount: 0, weakCount: 0, synergyCount: 0);

    final strong = List<String>.from(data["strong"]);
    final weak = List<String>.from(data["weak"]);
    final synergy = List<String>.from(data["synergy"]);

    int strongCount = 0;
    int weakCount = 0;
    int synergyCount = 0;

    for (final e in enemyTeam) {
      if (e == null) continue;

      if (strong.contains(e.name)) strongCount++;
      if (weak.contains(e.name)) weakCount++;
      if (synergy.contains(e.name)) synergyCount++;
    }

    return ScoreBreakdown(
      strongCount: strongCount,
      weakCount: weakCount,
      synergyCount: synergyCount,
    );
  }

  // ----------------------------------------------------------
  // COMPUTE TOP 3 PICKS (sorted by total score)
  // ----------------------------------------------------------
  Future<List<Map<String, dynamic>>> computeTopPicks({
    required List<HeroModel> laneHeroes,
    required List<HeroModel?> enemyTeam,
  }) async {
    final results = <Map<String, dynamic>>[];

    for (final hero in laneHeroes) {
      final breakdown = computeScoreForHero(hero, enemyTeam);
      results.add({
        "hero": hero,
        "breakdown": breakdown,
        "total": breakdown.total,
      });
    }

    // SORT BY SCORE DESCENDING
    results.sort((a, b) => b["total"].compareTo(a["total"]));

    return results;
  }
}
