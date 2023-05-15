import 'package:chat_leng/app/modules/home/bindings/home_binding.dart';
import 'package:chat_leng/app/modules/home/presentation/view/detail_page.dart';

import 'package:go_router/go_router.dart';

import '../core/utils/get_extends/binding_builder.dart';
import '../modules/home/presentation/view/home_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) =>
        BindBuilder(binding: HomeBinding(), builder: () => const HomePage()),
  ),
  GoRoute(
    path: "/detail",
    builder: (context, state) =>
        BindBuilder(binding: HomeBinding(), builder: () => const DetailPage()),
  )
]);
