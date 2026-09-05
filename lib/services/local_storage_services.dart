import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveFavorite(String value) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites =
        prefs.getStringList('favorites') ?? [];

    if (!favorites.contains(value)) {
      favorites.add(value);
    }

    await prefs.setStringList(
      'favorites',
      favorites,
    );
  }

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('favorites') ?? [];
  }
}