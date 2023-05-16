import 'package:chat_leng/app/core/utils/go_route/go_route_binding.dart';
import 'package:chat_leng/app/modules/home/bindings/detail_binding.dart';
import 'package:chat_leng/app/modules/home/bindings/home_binding.dart';
import 'package:chat_leng/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:chat_leng/app/modules/home/presentation/controllers/test_controller.dart';
import 'package:chat_leng/app/modules/home/presentation/view/home_page.dart';

import 'package:go_router/go_router.dart';
import '../modules/home/presentation/view/detail_page.dart';

final router = GoRouter(routes: [
  BindingRouter(
    HomeController(),
    path: "/",
    page: (context, state) => const HomePage(),
  ),
  BindingRouter(
    TestController(),
    binding: HomeBinding(),
    path: "/detail",
    page: (context, state) => const DetailPage(),
   
  ),
]);
