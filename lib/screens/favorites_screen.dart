
import 'package:material_ui/material_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/post.dart';
import '../services/favorites_service.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<Post>('favoritesBox');
    final favoritesService = FavoritesService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ValueListenableBuilder(
        valueListenable: favoritesBox.listenable(),
        builder: (context, box, widget) {
          final favorites = box.values.toList();

          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final post = favorites[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                  ),
                  title: Text(
                    post.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(post.body),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    tooltip: 'Remove from Favorites',
                    onPressed: () async {
                      await favoritesService.toggleFavorite(post);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
