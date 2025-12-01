class ScoreBreakdown {
  final int strongCount;
  final int weakCount;
  final int synergyCount;

  int get total => strongCount + synergyCount - weakCount;

  const ScoreBreakdown({
    required this.strongCount,
    required this.weakCount,
    required this.synergyCount,
  });

  factory ScoreBreakdown.fromMap(Map<String, dynamic> map) {
    return ScoreBreakdown(
      strongCount: map["strong"] ?? 0,
      weakCount: map["weak"] ?? 0,
      synergyCount: map["synergy"] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "strong": strongCount,
      "weak": weakCount,
      "synergy": synergyCount,
      "total": total,
    };
  }
}
