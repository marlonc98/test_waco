import 'package:dio/dio.dart';
import 'package:test_waco/domain/entities/Post.dart';
import 'package:test_waco/domain/repositories/PostRepository.dart';

class PostHerokuRepository implements PostRepository {
  @override
  Future<Post?> add(Post post) async {
    return null;
  }

  @override
  Future<bool> delete(int id) async {
    return false;
  }

  @override
  Future<List<Post>> get() async {
    try {
      dynamic response = await Dio().get('http://waco-api.herokuapp.com/api/posts');
      if (response == null) return [];
      List<dynamic> jsonResponse = response.data['data'];
      return jsonResponse
          .map<Post>((json) => Post.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
