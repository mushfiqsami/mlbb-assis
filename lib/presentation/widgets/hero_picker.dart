import 'package:flutter/material.dart';
import '../../domain/models/hero_model.dart';

class HeroPicker {
  static Future<HeroModel?> show(
    BuildContext context,
    List<HeroModel> allHeroes,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return _HeroPickerDialog(allHeroes: allHeroes);
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
// DIALOG WIDGET
// ─────────────────────────────────────────────────────────────

class _HeroPickerDialog extends StatefulWidget {
  final List<HeroModel> allHeroes;

  const _HeroPickerDialog({required this.allHeroes});

  @override
  State<_HeroPickerDialog> createState() => _HeroPickerDialogState();
}

class _HeroPickerDialogState extends State<_HeroPickerDialog> {
  String search = "";
  String selectedLane = "all";

  final lanes = ["all", "exp", "jungle", "mid", "roam", "gold"];

  @override
  Widget build(BuildContext context) {
    // FILTER HEROES
    final filtered = widget.allHeroes.where((h) {
      final matchLane =
          selectedLane == "all" || h.lane.toLowerCase() == selectedLane;
      final matchSearch =
          h.name.toLowerCase().contains(search.toLowerCase());
      return matchLane && matchSearch;
    }).toList();

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              "Select Hero",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Search Bar
            TextField(
              decoration: const InputDecoration(
                hintText: "Search hero...",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => search = v),
            ),

            const SizedBox(height: 12),

            // LANE FILTER BUTTONS
            Wrap(
              spacing: 8,
              children: lanes.map((lane) {
                final isSelected = lane == selectedLane;
                return ChoiceChip(
                  label: Text(lane.toUpperCase()),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => selectedLane = lane);
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            // HERO GRID
            SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: filtered.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final hero = filtered[index];

                  return GestureDetector(
                    onTap: () => Navigator.pop(context, hero),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage(
                            "assets/images/heroes/${hero.name}.png",
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          hero.name.toUpperCase(),
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Cancel Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
