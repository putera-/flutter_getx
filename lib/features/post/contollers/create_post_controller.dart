import 'package:get/get.dart';
import 'package:pgn_revamp/core/utils/snackbar.dart';
import 'package:pgn_revamp/data/models/post_model.dart';
import 'package:pgn_revamp/data/repositories/post_repository.dart';

class CreatePostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final RxBool isLoading = false.obs;

  Future<void> create(String title, String body) async {
    isLoading.value = true;
    try {
      Post post = Post(
        userId: 1,
        title: title,
        body: body,
      );

      await _postRepository.createPost(post);

      showSnackBar('Success', 'Post created successfully');
    } catch (e) {
      showSnackBar('Error', 'Failed to fetch post data');
    } finally {
      isLoading.value = false;
    }
  }
}
