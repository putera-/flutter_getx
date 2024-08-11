import 'package:get/get.dart';
import 'package:pgn_revamp/features/post/contollers/post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController());
  }
}
