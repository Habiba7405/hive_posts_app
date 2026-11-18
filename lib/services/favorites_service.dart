
import 'package:hive_flutter/hive_flutter.dart';
import '../models/post.dart';

class FavoritesService {
  final Box<Post> _favoritesBox =
      Hive.box<Post>('favoritesBox');

  // Add or remove a post from favorites
  Future<void> toggleFavorite(Post post) async {
    if (_favoritesBox.containsKey(post.id)) {
      await _favoritesBox.delete(post.id);
    } else {
      final copy = Post(
        userId: post.userId,
        id: post.id,
        title: post.title,
        body: post.body,
      );

      await _favoritesBox.put(post.id, copy);
    }
  }

  // Check if a post is a favorite
  bool isFavorite(int id) {
    return _favoritesBox.containsKey(id);
  }

  // Get all favorite posts
  List<Post> getFavorites() {
    return _favoritesBox.values.toList();
  }
}
