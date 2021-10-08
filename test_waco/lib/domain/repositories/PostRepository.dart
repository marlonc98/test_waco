import 'package:test_waco/domain/entities/Post.dart';

abstract class PostRepository{
  Future<List<Post>> get();
  Future<Post?> add(Post post);
  Future<bool> delete(int id);

}