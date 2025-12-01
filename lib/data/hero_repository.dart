import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/models/hero_model.dart';

class HeroRepository {
  static Future<List<HeroModel>> loadHeroes() async {
    final jsonString = await rootBundle.loadString("assets/data/heroes.json");
    final Map<String, dynamic> raw = json.decode(jsonString);

    return raw.entries
        .map((entry) => HeroModel.fromJson(entry.key, entry.value))
        .toList();
  }
}
