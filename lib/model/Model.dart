import 'package:flutter/foundation.dart';
import 'package:rows_and_cols/entity/Post.dart';

class Model extends ChangeNotifier {
  // static var fakeDbStories = _initPosts(); // todo we should take it from db
  List<Post> _saved = [];
  //List<Post> _seen = [];


  void save(Post post) {
    _saved.add(post);
    notifyListeners();
  }

  // void see(Post post) {
  //   _seen.add(post);
  //   // notifyListeners();
  // }

  List<Post> get saved => _saved;

// static List<Post> _initPosts() {
  //   List<Post> posts = [];
  //   for (int i = 0; i < 9; i++) {
  //     posts.add(Post());
  //   }
  //   return posts;
  // }
}
