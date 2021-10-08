import 'package:flutter/material.dart';
import 'package:test_waco/data/repositories/post/PostFirebaseRepository.dart';
import 'package:test_waco/data/repositories/post/PostHerokuRepository.dart';
import 'package:test_waco/domain/entities/Post.dart';
import 'package:test_waco/ui/pages/posts/widgets/PostBottomNavigation.dart';
import 'package:test_waco/ui/pages/posts/widgets/PostItem.dart';
import 'package:test_waco/ui/widgets/CustomLayout.dart';

class PostPage extends StatefulWidget {
  static const route = '/postsPage';
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];
  List<Post> favorites = [];
  int indexBottom = 0;

  @override
  void initState() {
    super.initState();
    getPosts();
    getFavorites();
  }

  bool checkIsFavorite(Post post) {
    return favorites.where((element) => element.id == post.id).length > 0;
  }

  getPosts() async {
    List<Post> tempPosts = await PostHerokuRepository().get();
    setState(() {
      posts = tempPosts;
    });
  }

  getFavorites() async {
    List<Post> tempFavorites = await PostFirebaseRepository().get();
    setState(() {
      favorites = tempFavorites;
    });
  }

  _addFavorite(Post post) {
    favorites.add(post);
    setState(() {
      favorites = favorites;
    });
    PostFirebaseRepository().add(post);
  }

  _deleteFavorite(Post post) {
    favorites.remove(post);
    setState(() {
      favorites = favorites;
    });
    PostFirebaseRepository().delete(post.id);
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      body: ListView(
          children: (indexBottom == 0 ? posts : favorites)
              .map((e) => PostItem(
                  post: e,
                  isFavorite: checkIsFavorite(e),
                  addFavorite: () => _addFavorite(e),
                  deleteFavorite: () => _deleteFavorite(e)))
              .toList()),
      bottomNavigationBar: PostBottomNavigation(
        context: context,
        index: indexBottom,
        onTap: (value) {
          setState(() {
            indexBottom = value;
          });
        },
      ),
    );
  }
}
