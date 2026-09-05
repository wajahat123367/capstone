import 'package:capstone/models/items_model.dart';
import 'package:capstone/screens/setting_screen.dart';
import 'package:capstone/services/api_services.dart';
import 'package:capstone/services/local_storage_services.dart';
import 'package:flutter/material.dart';


import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ItemModel>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = ApiService.fetchItems();
  }

  Future<void> saveItem(String title) async {
    await LocalStorageService.saveFavorite(title);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title saved locally'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            child: Icon(
              Icons.travel_explore,
            ),
          ),
        ),
        title: const Text(
          'Explore App',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ItemModel>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading API data',
              ),
            );
          }

          final items = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.article,
                    ),
                  ),
                  title: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                    ),
                    onPressed: () {
                      saveItem(
                        item.title,
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(
                          item: item,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}