import 'package:pgn_revamp/data/models/post_model.dart';
import 'package:pgn_revamp/services/http_service.dart';

class PostProvider {
  final HttpService _httpService;
  PostProvider(this._httpService);

  Future<List<Post>> get() async {
    final response = await _httpService.get('/posts');
    if (response.statusCode == 200) {
      final List<dynamic> json = response.data;
      return json.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> getById(int id) async {
    final response = await _httpService.get('/posts/$id');
    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Post> create(Post post) async {
    // final response = await _httpService.post('/posts', post.toJson());
    // if (response.statusCode == 201) {
    //   return Post.fromJson(response.data);
    // } else {
    //   throw Exception('Failed to create post');
    // }

    return post;
  }
}
