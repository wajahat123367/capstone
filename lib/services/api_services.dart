import 'dart:convert';
import 'package:capstone/models/items_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ItemModel>> fetchItems() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      ),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data
          .take(10)
          .map(
            (json) => ItemModel.fromJson(json),
          )
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}