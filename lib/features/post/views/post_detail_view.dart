import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pgn_revamp/features/post/contollers/post_detail_controller.dart';
import 'package:pgn_revamp/features/post/widgets/post_widget.dart';

class PostDetailView extends GetView<PostDetailController> {
  final int postId;

  const PostDetailView({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    controller.fetchPost(postId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.post.value == null) {
          return const Center(child: Text("Post Not found"));
        } else {
          final post = controller.post.value!;

          return PostWidget(post: post);
        }
      }),
    );
  }
}
