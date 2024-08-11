import 'package:pgn_revamp/data/models/post_model.dart';
import 'package:pgn_revamp/data/providers/post_provider.dart';
import 'package:pgn_revamp/services/http_service.dart';

class PostRepository {
  late final PostProvider _postProvider;

  PostRepository() {
    final httpService = HttpService();
    _postProvider = PostProvider(httpService);
  }

  Future<List<Post>> getPosts() async {
    return await _postProvider.get();
  }

  Future<Post> getPost(int id) async {
    return await _postProvider.getById(id);
  }

  Future<Post> createPost(Post post) async {
    return await _postProvider.create(post);
  }
}
