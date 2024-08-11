import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import 'package:pgn_revamp/features/home/views/home_view.dart';
import 'package:pgn_revamp/features/post/bindings/create_post_binding.dart';
import 'package:pgn_revamp/features/post/bindings/post_detail_binding.dart';
import 'package:pgn_revamp/features/post/bindings/post_list_binding.dart';
import 'package:pgn_revamp/features/post/views/create_post_view.dart';
import 'package:pgn_revamp/features/post/views/post_detail_view.dart';
import 'package:pgn_revamp/features/post/views/post_list_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        // builder: RouterTools
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
        path: '/post',
        builder: (BuildContext context, GoRouterState state) {
          // Inject dependencies using GetX binding
          PostListBinding().dependencies();
          return const PostListView();
        },
      ),
      GoRoute(
        path: '/post/:id',
        builder: (BuildContext context, GoRouterState state) {
          final postId = int.parse(state.pathParameters['id']!);

          // Inject dependencies using GetX binding
          PostDetailBinding().dependencies();
          return PostDetailView(postId: postId);
        },
      ),
      GoRoute(
        path: '/create-post',
        builder: (BuildContext context, GoRouterState state) {
          CreatePostBinding().dependencies();
          return const CreatePostView();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.fullPath}'),
      ),
    ),
  );
}

// class RouterTools {
//   static GoRouterWidgetBuilder globalContextBinder(GoRouterWidgetBuilder? goRouterWidgetBuilder) {
//     callback(context, state) {
//       // Here we can put every global controller/provider that needs the go_router context !
//       if (Get.isRegistered<RootController>() == false) {
//         Get.lazyPut(() => RootController(context: context));
//       }

//       return goRouterWidgetBuilder!(context, state);
//     }

//     return callback;
//   }
// }

