import 'package:get/get.dart';
import 'package:pgn_revamp/features/post/contollers/create_post_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePostController());
  }
}
