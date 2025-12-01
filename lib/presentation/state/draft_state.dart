import '../../domain/models/hero_model.dart';

class DraftState {
  // lane selected by user (exp, gold, mid, jungle, roam)
  String? selectedLane;

  // teams (null = empty slot)
  final List<HeroModel?> myTeam = List.filled(5, null);
  final List<HeroModel?> enemyTeam = List.filled(5, null);

  // all heroes loaded from JSON
  List<HeroModel> allHeroes = [];

  // reset the full draft
  void reset() {
    selectedLane = null;
    for (int i = 0; i < 5; i++) {
      myTeam[i] = null;
      enemyTeam[i] = null;
    }
  }
}
