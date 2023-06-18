import 'package:chat_leng/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
      routes: [
        GoRoute(
          path: ":detail",
          builder: (context, state) => DetailPage(
            ok: state.pathParameters['detail'].toString(),
          ),
        )
      ])
]);
