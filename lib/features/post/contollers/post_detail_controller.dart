import 'package:get/get.dart';
import 'package:pgn_revamp/core/utils/snackbar.dart';
import 'package:pgn_revamp/data/models/post_model.dart';
import 'package:pgn_revamp/data/repositories/post_repository.dart';

class PostDetailController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final Rx<Post?> post = Rx<Post?>(null);
  final RxBool isLoading = false.obs;

  Future<void> fetchPost(int id) async {
    isLoading.value = true;
    try {
      final Post fetchedPost = await _postRepository.getPost(id);
      post.value = fetchedPost;
    } catch (e) {
      showSnackBar('Error', 'Failed to fetch post data');
    } finally {
      isLoading.value = false;
    }
  }
}
