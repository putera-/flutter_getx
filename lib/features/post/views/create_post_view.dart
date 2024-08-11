import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:pgn_revamp/features/post/contollers/create_post_controller.dart';
import 'package:pgn_revamp/features/post/contollers/post_list_controller.dart';

class CreatePostView extends GetView<CreatePostController> {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          final navigator = Navigator.of(context);
                          await controller.create(
                            titleController.text,
                            bodyController.text,
                          );

                          // re-fetch all post data
                          Get.find<PostListController>().fetchPosts();

                          // go back to post list page
                          if (navigator.mounted) {
                            navigator.pop();
                          }
                        },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Create Post'),
                )),
          ],
        ),
      ),
    );
  }
}
