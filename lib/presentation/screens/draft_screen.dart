import 'package:flutter/material.dart';
import '../logic/draft_logic.dart';
import '../state/draft_state.dart';
import '../../domain/models/hero_model.dart';

class DraftScreen extends StatefulWidget {
  final DraftLogic logic;
  final DraftState state;

  const DraftScreen({
    super.key,
    required this.logic,
    required this.state,
  });

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  @override
  void initState() {
    super.initState();
    widget.logic.loadHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "MLBB Draft Assistant",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------------------------------------
            // Select Lane
            // ----------------------------------------------------------
            Row(
              children: [
                const Text(
                  "Select your lane",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: widget.state.selectedLane,
                  items: const [
                    DropdownMenuItem(value: "exp", child: Text("EXP")),
                    DropdownMenuItem(value: "jungle", child: Text("JUNGLE")),
                    DropdownMenuItem(value: "mid", child: Text("MID")),
                    DropdownMenuItem(value: "roam", child: Text("ROAM")),
                    DropdownMenuItem(value: "gold", child: Text("GOLD")),
                  ],
                  onChanged: (lane) {
                    setState(() {
                      widget.logic.selectLane(lane!);
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ----------------------------------------------------------
            // Main columns: My Team – Enemy Team – Counters
            // ----------------------------------------------------------
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------------------------------- MY TEAM ----------------------------
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "YOUR TEAM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(5, (i) => _buildHeroSlot(i, true)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 25),

                  // ------------------------------- ENEMY TEAM ----------------------------
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ENEMY TEAM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(5, (i) => _buildHeroSlot(i, false)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 25),

                  // ------------------------------- COUNTERS SECTION ------------------------
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "COUNTERS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ..._buildCounterTiles(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ----------------------------------------------------------
            // Top 3 picks (existing)
            // ----------------------------------------------------------
            FutureBuilder<List<Map<String, dynamic>>>(
              future: widget.logic.computeTop3(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox.shrink();
                }

                final top3 = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Top 3 Best Picks:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (final row in top3)
                      Text(
                        "• ${row["hero"].name.toUpperCase()} (Score: ${row["total"]})",
                        style: const TextStyle(fontSize: 14),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 15),

            // ----------------------------------------------------------
            // Reset Button
            // ----------------------------------------------------------
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.state.reset();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade50,
                  foregroundColor: Colors.blue.shade700,
                ),
                child: const Text("Reset Draft"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // HERO PICK TILE
  // ----------------------------------------------------------
  Widget _buildHeroSlot(int index, bool isMyTeam) {
    final hero = isMyTeam
        ? widget.state.myTeam[index]
        : widget.state.enemyTeam[index];

    return InkWell(
      onTap: () async {
        final picked = isMyTeam
            ? await widget.logic.pickHeroForMyTeam(context, index)
            : await widget.logic.pickHeroForEnemyTeam(context, index);

        if (picked != null) setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.purple, width: 1.3),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.purple.shade100,
              backgroundImage:
                  (hero != null && hero.image.isNotEmpty)
                      ? AssetImage(hero.image)
                      : null,
            ),
            const SizedBox(width: 12),
            Text(
              hero?.name.toUpperCase() ?? "Tap to pick hero",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // COUNTERS TILE (each enemy hero -> 5 counter icons)
  // ----------------------------------------------------------
  List<Widget> _buildCounterTiles() {
  final List<Widget> tiles = [];

  for (final enemy in widget.state.enemyTeam) {
    if (enemy == null) continue;

    // weakAgainst = counters to this enemy
    final counterNames = enemy.weakAgainst;

    // find hero objects
    final counterHeroes = widget.state.allHeroes
        .where((h) => counterNames.contains(h.name))
        .take(5)
        .toList();

    tiles.add(
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.purple, width: 1.3),
        ),
        child: Wrap(
          spacing: 10,
          children: counterHeroes.map((hero) {
            return CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(hero.image),
            );
          }).toList(),
        ),
      ),
    );
  }

  return tiles;
}

}
