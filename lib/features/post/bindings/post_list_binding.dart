import 'package:get/get.dart';
import 'package:pgn_revamp/features/post/contollers/post_list_controller.dart';

class PostListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostListController());
  }
}
