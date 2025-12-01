import 'package:flutter/material.dart';

import '../../domain/services/draft_service.dart';
import '../../domain/models/hero_model.dart';
import '../state/draft_state.dart';
import '../widgets/hero_picker.dart';

class DraftLogic {
  final DraftService service;
  final DraftState state;

  DraftLogic(this.service, this.state);

  // ---------------------------------------------------------
  // Load all heroes once
  // ---------------------------------------------------------
  Future<void> loadHeroes() async {
    state.allHeroes = await service.loadHeroes();


  }

  // ---------------------------------------------------------
  // Select lane
  // ---------------------------------------------------------
  void selectLane(String lane) {
    state.selectedLane = lane;
  }

  // ---------------------------------------------------------
  // Pick hero for MY TEAM
  // ---------------------------------------------------------
  Future<HeroModel?> pickHeroForMyTeam(
    BuildContext context,
    int index,
  ) async {
    final selected = await HeroPicker.show(
      context,
      state.allHeroes,
    );

    if (selected != null) {
      state.myTeam[index] = selected;
    }

    return selected;
  }

  // ---------------------------------------------------------
  // Pick hero for ENEMY TEAM
  // ---------------------------------------------------------
  Future<HeroModel?> pickHeroForEnemyTeam(
    BuildContext context,
    int index,
  ) async {
    final selected = await HeroPicker.show(
      context,
      state.allHeroes,
    );

    if (selected != null) {
      state.enemyTeam[index] = selected;
    }

    return selected;
  }

  // ---------------------------------------------------------
  // Compute top 3 counters (with breakdown)
  // ---------------------------------------------------------
  Future<List<Map<String, dynamic>>> computeTop3() async {
    if (state.selectedLane == null) return [];

    final lane = state.selectedLane!;
    final laneHeroes = await service.loadHeroesByLane(lane);

    // Remove picked heroes
    final takenNames = <String>{
      ...state.myTeam.where((h) => h != null).map((h) => h!.name),
      ...state.enemyTeam.where((h) => h != null).map((h) => h!.name),
    };

    final available = laneHeroes
        .where((h) => !takenNames.contains(h.name))
        .toList();

    // Compute recommendations
    final results = await service.computeTopPicks(
      laneHeroes: available,
      enemyTeam: state.enemyTeam,
    );

    return results.take(3).toList();
  }
}
