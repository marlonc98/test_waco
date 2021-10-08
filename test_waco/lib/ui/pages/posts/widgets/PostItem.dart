import 'package:flutter/material.dart';
import 'package:test_waco/domain/entities/Post.dart';
import 'package:url_launcher/url_launcher.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final bool isFavorite;
  final Function() deleteFavorite;
  final Function() addFavorite;

  PostItem(
      {Key? key,
      required this.post,
      required this.addFavorite,
      required this.deleteFavorite,
      this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 16),
                    child: isFavorite
                        ? IconButton(
                            onPressed: this.deleteFavorite,
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 24,
                            ))
                        : IconButton(
                            onPressed: this.addFavorite,
                            icon: Icon(Icons.favorite_border, size: 24),
                          )),
                Expanded(
                    child: Text(post.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )))
              ],
            ),
            Text(post.body),
            TextButton(
                onPressed: () => launch(post.link), child: Text('ver más'))
          ],
        ));
  }
}
