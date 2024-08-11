import 'package:get/get.dart';
import 'package:pgn_revamp/core/utils/snackbar.dart';
import 'package:pgn_revamp/data/models/post_model.dart';
import 'package:pgn_revamp/data/repositories/post_repository.dart';

class PostListController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final RxList<Post> posts = RxList<Post>([]);
  final RxBool isLoading = false.obs;

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      posts.clear(); // Empty the posts list before fetching new data
      final List<Post> fetchedPosts = await _postRepository.getPosts();
      posts.assignAll(fetchedPosts);
      showSnackBar("Success", "Get All Post successfully");
    } catch (e) {
      showSnackBar('Error', 'Failed to fetch posts data');
    } finally {
      isLoading.value = false;
    }
  }
}
