import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_waco/domain/entities/Post.dart';
import 'package:test_waco/domain/repositories/PostRepository.dart';

class PostFirebaseRepository implements PostRepository {
  @override
  Future<Post?> add(Post post) async {
    User currentUser = FirebaseAuth.instance.currentUser!;
    Map<String, dynamic> json = post.toJson();
    json['userId'] = currentUser.uid;
    try {
      await FirebaseFirestore.instance.collection('posts').add(json);
      post.userId = currentUser.uid;
      return post;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
    User currentUser = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance.collection('posts').where('id', isEqualTo: id).where('userId', isEqualTo: currentUser.uid).get().then((snapshot) {
        for(DocumentSnapshot ds in snapshot.docs)  {
            ds.reference.delete();
          }
      });
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<Post>> get() async {
    User currentUser = FirebaseAuth.instance.currentUser!;
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection('posts')
        .where('userId', isEqualTo: currentUser.uid)
        .get();
    if (response.docs.length <= 0) return [];
    return response.docs
        .map((e) {
          return {...e.data(), 'doc_id': e.id};
        })
        .map<Post>((json) => Post.fromJson(json))
        .toList();
  }
}
