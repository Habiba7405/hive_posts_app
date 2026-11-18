
import 'package:material_ui/material_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/post.dart';
import '../services/api_service.dart';
import '../services/favorites_service.dart';
import 'favorites_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final ApiService apiService = ApiService();
  final FavoritesService favoritesService = FavoritesService();

  List<Post> posts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadPosts();
  }


Future<void> loadPosts() async {
  final box = Hive.box<Post>('postsBox');

  try {
    final result = await apiService.fetchPosts();

    await box.clear();
    await box.addAll(result);

    print('Loaded from API');

    setState(() {
      posts = result;
      isLoading = false;
      errorMessage = null;
    });
  } catch (e) {
    final savedPosts = box.values.toList();

    print('Loaded from Hive (Offline Mode)');

    setState(() {
      posts = savedPosts;
      isLoading = false;

      if (savedPosts.isEmpty) {
        errorMessage =
            'No internet connection and no saved posts.';
      } else {
        errorMessage = null;
      }
    });
  }
}


  Future<void> toggleFavorite(Post post) async {
    await favoritesService.toggleFavorite(post);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: const Text('Posts'),
  backgroundColor:
      Theme.of(context).colorScheme.inversePrimary,
  actions: [
    IconButton(
      icon: const Icon(Icons.favorite),
      tooltip: 'My Favorites',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const FavoritesScreen(),
          ),
        );
      },
    ),
  ],
),
      
body: isLoading
    ? const Center(child: CircularProgressIndicator())
    : errorMessage != null
        ? Center(child: Text(errorMessage!))
        : ValueListenableBuilder(
            valueListenable:
                Hive.box<Post>('favoritesBox').listenable(),
            builder: (context, favoritesBox, child) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  final isFavorite =
                      favoritesService.isFavorite(post.id);

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
                        icon: Icon(
                          isFavorite
                              ? Icons.star
                              : Icons.star_border,
                          color: isFavorite
                              ? Colors.amber
                              : null,
                        ),
                        onPressed: () {
                          toggleFavorite(post);
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
