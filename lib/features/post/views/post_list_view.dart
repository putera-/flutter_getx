import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgn_revamp/features/post/contollers/post_list_controller.dart';
import 'package:go_router/go_router.dart';

import '../widgets/post_widget.dart';

class PostListView extends GetView<PostListController> {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchPosts();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Post List'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context.push('/create-post'),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                final post = controller.posts[index];
                return GestureDetector(
                  onTap: () {
                    // Handle click event here
                    // Navigate to post details page and enable pop
                    context.push('/post/${post.id}');
                  },
                  child: PostWidget(post: post),
                );
              },
            );
          }
        }));
  }
}
